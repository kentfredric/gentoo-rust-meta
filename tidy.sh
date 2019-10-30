set -e -u -o pipefail
shopt -q -u dotglob
shopt -q -s globstar
shopt -q -s nullglob

perltidy -b -bext=/ meta/**/*.pl rdeps.pl lib/*.pm  || exit 1

perl rdeps.pl > deps.tgf || exit 1
