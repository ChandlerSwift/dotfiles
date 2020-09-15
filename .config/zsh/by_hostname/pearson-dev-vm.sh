# https://stackoverflow.com/a/56264110
DIR=$(dirname ${(%):-%x})

echo including $DIR/pearson-dev.sh
source $DIR/pearson-dev.sh
