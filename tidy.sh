set -e -u -o pipefail
shopt -q -u dotglob
shopt -q -s globstar
shopt -q -s nullglob

if [ "${NOTIDY:-0}" == "0" ]; then
  perltidy -b -bext=/ meta/**/*.pl rdeps.pl lib/*.pm  || exit 1
fi
perl rdeps.pl > deps.tgf || exit 1
