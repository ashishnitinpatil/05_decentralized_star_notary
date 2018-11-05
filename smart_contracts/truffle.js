var HDWalletProvider = require('truffle-hdwallet-provider');

const mnemonic = 'core barely fold sample icon display hollow smoke task emotion pepper unity';
const infura = 'https://rinkeby.infura.io/v3/36014bb8d6f7423d91d411769c3b9b07'


module.exports = {
  networks: {
    development: {
      host: '127.0.0.1',
      port: 8545,
      network_id: "*"
    },
    rinkeby: {
      provider: () => new HDWalletProvider(mnemonic, infura),
      network_id: 4,
      gas : 6700000,
      gasPrice : 10000000000
    },
  }
};
