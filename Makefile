# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# deps
update:; forge update

# Build & test
build  :; forge build
test   :; forge test -vvv --rpc-url=${ETH_RPC_URL}
trace   :; forge test -vvvv --rpc-url=${ETH_RPC_URL}
clean  :; forge clean
snapshot :; forge snapshot