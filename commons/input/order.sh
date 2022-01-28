

JQ_CLI=''
THE_ORDER=''

print_usage() {
  cat << "EOF"
    OPTIONS
        -h  Stampa questo help
        -o  ID dell'ordine
        -v  Modalità verbosa
        -j  Utilizza jq in pipe
        -q  Insieme con il flag -j per specificare il filtro jq
EOF
}

while getopts 'vjhq:o:' flag; do
  case "${flag}" in
    j) USE_JQ="true" ;;
    v) VERBOSE="true" ;;
    q) JQ_CLI="${OPTARG}" ;;
    o) THE_ORDER="${OPTARG}" ;;
    h) print_usage
       exit 1 ;;
    *) print_usage
       exit 1 ;;
  esac
done