start_stellar_horizon() {
    ./bin/horizon db migrate up
    ./bin/horizon serve
}

if [ -f /opt/stellar/horizon/.horizon-initialized ]
    then
    echo "horizon: already initialized"
    start_stellar_horizon
    return 0
fi
./bin/horizon db init
touch .horizon-initialized
start_stellar_horizon

