
JQ_CLI=''
PRINT_COMMAND=''

print_usage() {
  cat << "EOF"
    OPTIONS
        -h  Stampa questo help
        -p  Stampa a video il comando curl da eseguire
        -v  Modalità verbosa
        -p  Stampa il comando curl invece che eseguirlo
        -j  Utilizza jq in pipe
        -q  Insieme con il flag -j per specificare il filtro jq
EOF
}

while getopts 'vpjhq:' flag; do
  case "${flag}" in
    j) USE_JQ="true" ;;
    v) VERBOSE="true" ;;
    p) PRINT_COMMAND="true" ;;
    q) JQ_CLI="${OPTARG}" ;;
    h) print_usage
       exit 1 ;;
    *) print_usage
       exit 1 ;;
  esac
done