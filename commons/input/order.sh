

JQ_CLI=''
PRINT_COMMAND=''
THE_ORDER=''

print_usage() {
  cat << "EOF"
    OPTIONS
        -h  Stampa questo help
        -p  Stampa a video il comando curl da eseguire
        -o  ID dell'ordine
        -v  Modalità verbosa
        -j  Utilizza jq in pipe
        -q  Insieme con il flag -j per specificare il filtro jq
EOF
}

while getopts 'vpjhq:o:' flag; do
  case "${flag}" in
    j) USE_JQ="true" ;;
    v) VERBOSE="true" ;;
    p) PRINT_COMMAND="true" ;;
    q) JQ_CLI="${OPTARG}" ;;
    o) THE_ORDER="${OPTARG}" ;;
    h) print_usage
       exit 1 ;;
    *) print_usage
       exit 1 ;;
  esac
done