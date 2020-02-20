die() {
  printf "\e[1;31m * \e[0m%s\n" "$1"
  exit 1
}

name="${1:?no name passed for argument 1}"
version="${2:?no version passed for crate ${name}}"

printf "Killing \e[1;33m%s\e[31m/\e[0;1;33m%s\e[0m\n" "${name}" "${version}"

prefix="${name:0:1}"
src="meta/${prefix}/${name}"
src_file="${src}/${version}.pl"
dest="dead-meta/${prefix}/${name}"
dest_file="${dest}/${version}.pl"

printf "Source: %s\n" "${src_file}" 
printf "Dest: %s\n" "${dest_file}"

[[ -e "${src_file}" ]] || die "${src_file} does not exist"
if ! [[ -e "${dest}" ]]; then
  mkdir -v -p "${dest}" || die "Can't mkdir ${dest}"
fi
mv -v -n -t "${dest}" "${src_file}" || die "mving ${src_file} to ${dest} failed"
git add -- "${src_file}" "${dest_file}" || die "git add failed"
bash tidy.sh
