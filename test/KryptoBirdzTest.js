const assert = require('chai');
const Kryptobird = artifacts.require('./KryptoBird');

contract('KryptoBirdz', () => {
    let contract;
    describe('deployement', async () => {
        it('deploys successfuly', async () => {
            contract = await Kryptobird.deployed();
        })
    })
})