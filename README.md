# Decentralized Star Notary

Project #5 of Udacity Blockchain Developer Nanodegree (ND1309)


## Summary

- Contract address: [0x912562408975a79cf5adaf37f155da5eb568e9c8](https://rinkeby.etherscan.io/address/0x912562408975a79cf5adaf37f155da5eb568e9c8)
- Contract creation tx: [0x51f54839d61fb7b675fdf536baec438b480642330ccb3641bab9cfc090eae099](https://rinkeby.etherscan.io/tx/0x51f54839d61fb7b675fdf536baec438b480642330ccb3641bab9cfc090eae099)
- Created Star's tokenId: 2
- putStarUpForSale tx: [0x21f79077418f2e142664675c52b2ecf8f1936eeb86bbff8cc01b6c29f9bc8358](https://rinkeby.etherscan.io/tx/0x21f79077418f2e142664675c52b2ecf8f1936eeb86bbff8cc01b6c29f9bc8358)


## Prerequisites

- ganache-cli
- truffle
- npm

Use NPM to install all [dependencies](/smart_contracts/package.json)

```
npm install
```


## Testing

Start the ganache-cli server & then run

```
truffle test
```


## Deploying

Use truffle for deployment (migration) to local / rinkeby network

```
truffle migrate [--reset] [--compile-all] --network development[|rinkeby]
```
