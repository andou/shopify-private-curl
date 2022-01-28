
JQ_CLI=''

print_usage() {
  cat << "EOF"
    OPTIONS
        -h  Stampa questo help
        -v  Modalità verbosa
        -j  Utilizza jq in pipe
        -q  Insieme con il flag -j per specificare il filtro jq
EOF
}

while getopts 'vjhq:' flag; do
  case "${flag}" in
    j) USE_JQ="true" ;;
    v) VERBOSE="true" ;;
    q) JQ_CLI="${OPTARG}" ;;
    h) print_usage
       exit 1 ;;
    *) print_usage
       exit 1 ;;
  esac
done