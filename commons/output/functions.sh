sep() {
    printf "###################################\n"
}

output(){
if [ "$PRINT_COMMAND" = "true" ]; then
    echo $OUT
elif [ "$USE_JQ" = "true" ]; then
    echo $OUT | jq "$JQ_CLI"
else
    echo $OUT
fi
}