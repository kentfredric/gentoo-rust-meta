crate_names() {
  find meta/ -maxdepth 2 -mindepth 2 -printf "%f\0" | sort -z
}
crate_versions() {
  local crate=$1
  shift
  find "meta/${crate:0:1}/${crate}" -name "*.pl" -printf "%f\n" | sed 's/\.pl$//' | sort -rV
}
avail_versions() {
  local crate=$1
  perl ~/bin/crateversions.pl "${crate}"
}

while read -r -d '' crate; do 
  printf  "\e[1m ==== [\e[1;31m %s \e[0;1m] ====\e[0m\n" "$crate"
  crate_versions "${crate}"
  avail_versions "${crate}"
done < <(crate_names)
