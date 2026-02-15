#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${1:-https://github.com/obengwilliam/dotfiles.git}"
GIT_DIR="${HOME}/.dotfiles"
WORK_TREE="${HOME}"

timestamp="$(date +"%Y%m%d_%H%M%S")"
backup_dir="${HOME}/.dotfiles_backup/${timestamp}"
log_file="${backup_dir}/backup.log"

if [ -d "${GIT_DIR}" ]; then
  echo "Error: ${GIT_DIR} already exists. Aborting to avoid overwriting."
  echo "If this is intentional, remove it and re-run."
  exit 1
fi

echo "Cloning bare repo from: ${REPO_URL}"
git clone --bare "${REPO_URL}" "${GIT_DIR}"

dotfiles() {
  git --git-dir="${GIT_DIR}" --work-tree="${WORK_TREE}" "$@"
}

dotfiles config --local status.showUntrackedFiles no

mkdir -p "${backup_dir}"

echo "Backing up existing dotfiles to: ${backup_dir}"
echo "Backup created: ${backup_dir}" > "${log_file}"

# List tracked files in the repo and back up any that already exist in $HOME.
while IFS= read -r path; do
  target="${WORK_TREE}/${path}"
  if [ -e "${target}" ] || [ -L "${target}" ]; then
    mkdir -p "${backup_dir}/$(dirname "${path}")"
    mv "${target}" "${backup_dir}/${path}"
    echo "BACKUP ${target} -> ${backup_dir}/${path}" >> "${log_file}"
  fi
done < <(dotfiles ls-tree -r --name-only HEAD)

echo "Checking out dotfiles into ${WORK_TREE}"
dotfiles checkout

echo
echo "Done."
echo "Backups are stored in: ${backup_dir}"
echo "Backup log: ${log_file}"
