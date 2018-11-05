# Decentralized Star Notary

Project #5 of Udacity Blockchain Developer Nanodegree (ND1309)


## Summary

- Contract address: [0x864ca8a0667862e9a25975557041114870c883ed](https://rinkeby.etherscan.io/address/0x864ca8a0667862e9a25975557041114870c883ed)
- Contract creation tx: [0xf9a01cdefae277e2cd28b80056e7e2110d476c3878fb0ac795419b98d085c9b4](https://rinkeby.etherscan.io/tx/0xf9a01cdefae277e2cd28b80056e7e2110d476c3878fb0ac795419b98d085c9b4)
- createStar tx: [0xfd763b88ba15e9a88ee2bcec5ec817cc47fa61ec7c4ca5b665c2a5c4697d421f](https://rinkeby.etherscan.io/tx/0xfd763b88ba15e9a88ee2bcec5ec817cc47fa61ec7c4ca5b665c2a5c4697d421f)
- putStarUpForSale tx: [0x178728ce66cf1ace2e12b230c2fe05d506a75354eaade86e01046b193c4c826c](https://rinkeby.etherscan.io/tx/0x178728ce66cf1ace2e12b230c2fe05d506a75354eaade86e01046b193c4c826c)


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
