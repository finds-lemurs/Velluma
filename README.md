# Velluma

## Overview
Velluma is a read-only Base Sepolia inspector that prints wallet and chain signals in a copyable format. It focuses on fast validation of RPC responsiveness, balance visibility, block data availability, and bytecode presence for a small set of addresses.

Built for Base.

## Why this exists
When you are setting up new tooling, you often need proof that your environment can read the chain reliably before you do anything interactive. Velluma is designed to:
- confirm Base Sepolia RPC liveness
- show that explorer links resolve to the right pages
- provide a repeatable output format that can be pasted into issues or reports
- validate that expected deployments actually exist by checking bytecode

## What it does
- initializes Coinbase Wallet SDK for wallet address discovery
- reads ETH balances for any available wallet addresses
- reads latest block number, timestamp, and gas price
- performs a quick JSON-RPC health check (eth_chainId) for the configured RPC
- checks getBytecode for each address listed in samples/targets.json
- prints direct Basescan links for addresses, blocks, and code pages

## What it never does
- does not send transactions
- does not sign messages
- does not write onchain state

## Internal flow
1) load Base Sepolia constants (chainId 84532, explorer root, RPC url)  
2) load inspection targets from samples/targets.json  
3) run a lightweight JSON-RPC check to verify chainId response  
4) initialize Coinbase Wallet provider and viem clients  
5) if wallet addresses exist, read balances and print Basescan address links  
6) read latest block and gas data and print Basescan block link  
7) run bytecode existence checks and print Basescan code links  

## Base sepolia details
- network: Base Sepolia  
- chainId (decimal): 84532  
- explorer: https://sepolia.basescan.org  

## Repository structure
- README.md  
- app/Velluma.mjs  
- package.json  
- contracts/VellumaProbe.sol 
- contracts/VellumaConfigAnchor.sol
- contracts/VellumaReceiptLog.sol
- config/base-sepolia.json  
- samples/targets.json  
- reports/latest.json  

## Author contacts
- GitHub: https://github.com/finds-lemurs
  
- X: https://x.com/Zina75761578
  
- Email: finds.lemurs.0g@icloud.com

## License
Mozilla Public License 2.0

## testnet deployment (base sepolia)
the following deployments are used only as validation references.

network: base sepolia  
chainId (decimal): 84532  
explorer: https://sepolia.basescan.org  

contract VellumaProbe.sol address:  
0xA4D1C7E9B2F0A6C3D5E7F8A1B4C6D8E0A2F5B7C9  

deployment and verification:
- https://sepolia.basescan.org/address/0xA4D1C7E9B2F0A6C3D5E7F8A1B4C6D8E0A2F5B7C9 
- https://sepolia.basescan.org/0xA4D1C7E9B2F0A6C3D5E7F8A1B4C6D8E0A2F5B7C9/0#code  

contract VellumaConfigAnchor.sol address:  
0x3B8E1A7C2D9F0A6C5E4B7D1A4F8C2B6D9A0E3F7B  

deployment and verification:
- https://sepolia.basescan.org/address/0x3B8E1A7C2D9F0A6C5E4B7D1A4F8C2B6D9A0E3F7B 
- https://sepolia.basescan.org/0x3B8E1A7C2D9F0A6C5E4B7D1A4F8C2B6D9A0E3F7B/0#code  

contract VellumaReceiptLog.sol address:  
0x7D2A9F4E6B8A0D3F5C9B2E7A1D4C6F8B3E0A1C7D

deployment and verification:
- https://sepolia.basescan.org/address/0x7D2A9F4E6B8A0D3F5C9B2E7A1D4C6F8B3E0A1C7D
- https://sepolia.basescan.org/0x7D2A9F4E6B8A0D3F5C9B2E7A1D4C6F8B3E0A1C7D/0#code  

these deployments provide a controlled environment for validating base tooling and read-only onchain access prior to base mainnet usage.
