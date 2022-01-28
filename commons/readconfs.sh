CONF_FILE=./confs/shp.cnf
. ./confs/colors.cnf
if [ ! -f "$CONF_FILE" ]; then
    printf "${RED}ERROR${NC} Missing ${CONF_FILE} configuration file\n"
    exit 1
fi
. $CONF_FILE