sep() {
    printf "###################################\n"
}

output(){
if [ "$USE_JQ" = "true" ]; then
    echo $OUT | jq "$JQ_CLI"
else
    echo $OUT
fi
}