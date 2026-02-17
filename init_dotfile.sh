#!/usr/bin/env bash
set -euo pipefail

REPO_URL=""
DRY_RUN=0

for arg in "$@"; do
  case "${arg}" in
    --dry-run)
      DRY_RUN=1
      ;;
    *)
      if [ -z "${REPO_URL}" ]; then
        REPO_URL="${arg}"
      else
        echo "Error: Unknown argument '${arg}'"
        exit 1
      fi
      ;;
  esac
done

REPO_URL="${REPO_URL:-https://github.com/obengwilliam/dotfiles.git}"
GIT_DIR="${HOME}/.dotfiles"
WORK_TREE="${HOME}"

timestamp="$(date +"%Y%m%d_%H%M%S")"
backup_dir="${HOME}/.dotfiles_backup/${timestamp}"
log_file="${backup_dir}/backup.log"

if [ "${DRY_RUN}" -eq 0 ]; then
  if [ -d "${GIT_DIR}" ]; then
    echo "Error: ${GIT_DIR} already exists. Aborting to avoid overwriting."
    echo "If this is intentional, remove it and re-run."
    exit 1
  fi
fi

if [ "${DRY_RUN}" -eq 1 ]; then
  temp_git_dir="$(mktemp -d "${TMPDIR:-/tmp}/dotfiles.XXXXXX")"
  trap 'rm -rf "${temp_git_dir}"' EXIT
  echo "Dry run: cloning bare repo to temp dir"
  git clone --bare "${REPO_URL}" "${temp_git_dir}"
  GIT_DIR="${temp_git_dir}"
else
  echo "Cloning bare repo from: ${REPO_URL}"
  git clone --bare "${REPO_URL}" "${GIT_DIR}"
fi

dotfiles() {
  git --git-dir="${GIT_DIR}" --work-tree="${WORK_TREE}" "$@"
}

dotfiles config --local status.showUntrackedFiles no

if [ "${DRY_RUN}" -eq 1 ]; then
  echo "Dry run: would back up existing dotfiles to: ${backup_dir}"
else
  mkdir -p "${backup_dir}"
  echo "Backing up existing dotfiles to: ${backup_dir}"
  echo "Backup created: ${backup_dir}" > "${log_file}"
fi

# List tracked files in the repo and back up any that already exist in $HOME.
while IFS= read -r path; do
  target="${WORK_TREE}/${path}"
  if [ -e "${target}" ] || [ -L "${target}" ]; then
    if [ "${DRY_RUN}" -eq 1 ]; then
      echo "WOULD_BACKUP ${target} -> ${backup_dir}/${path}"
    else
      mkdir -p "${backup_dir}/$(dirname "${path}")"
      mv "${target}" "${backup_dir}/${path}"
      echo "BACKUP ${target} -> ${backup_dir}/${path}" >> "${log_file}"
    fi
  fi
done < <(dotfiles ls-tree -r --name-only HEAD)

if [ "${DRY_RUN}" -eq 1 ]; then
  echo "Dry run: no files were changed."
  exit 0
fi

echo "Checking out dotfiles into ${WORK_TREE}"
dotfiles checkout

echo
echo "Done."
echo "Backups are stored in: ${backup_dir}"
echo "Backup log: ${log_file}"
