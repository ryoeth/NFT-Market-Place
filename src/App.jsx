import { useEffect } from 'react'
import detectEthereumProvider from '@metamask/detect-provider'
import Web3 from 'web3'
import Navbar from './components/Navbar'
import KryptoBird from './abis/KryptoBirdz.json'
import './App.css'
import { useState } from 'react'

function App() {

  const [accountDetail, setAccountDetail] = useState({
    accounts: null,
    networkId: null,
    contract: null,
    totalSupply: 0,
    KryptoBirdArray: []
  });

  const mint = async (kryptoBird) => {
    await accountDetail.contract.mthods.mint(kryptoBird).send({ from: accountDetail.accounts })
      .once('receipt', (receipt) => {
        setAccountDetail(accountDetail => ({ ...accountDetail.KryptoBirdArray, ...kryptoBird }));
      })
  }

  useEffect(() => {

    async function LoadWeb3() {
      const provider = await detectEthereumProvider();
      if (provider) {
        console.log('ethereum wallet is connected');
        window.web3 = new Web3(provider);
      }
      else {
        console.log('no ethereum wallet is connected');
      }
    }

    async function LoadBlockchainData() {
      // console.log(await window.web3);
      const acc = await window.web3.eth.getAccounts();
      const networkId = await window.web3.eth.net.getId();
      console.log(networkId, acc[0])
      return [acc[0], networkId];
    }

    async function call() {
      await LoadWeb3();
      let data = await LoadBlockchainData();
      const networkData = KryptoBird.networks[data[1]];
      if (networkData) {
        const abi = KryptoBird.abi;
        const networkDataAdress = networkData.address;
        const contract = new window.web3.eth.Contract(abi, networkDataAdress);
        const totalSupply = await contract.methods.totalSupply().call();
        const updatedAccount = { accounts: data[0], totalSupply: totalSupply, contract: contract };
        setAccountDetail(accountDetails => ({ ...accountDetails, ...updatedAccount }));
        let result = [];
        for (let i = 1; i < totalSupply; i++) {
          result.push(await contract.KryptoBird(i - 1).call());
        }
        setAccountDetail(accountDetails => ({ ...accountDetails.KryptoBirdArray, ...result }));

      }
    }

    call();
  }, [])

  return (
    <>
      <Navbar address={accountDetail.accounts} />
      
      <form className='form'>
        <div class="mb-3">
          <label for="exampleInputEmail1" class="form-label">Enter KryptoBird Name</label>
          <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" />
          <div id="emailHelp" class="form-text">We'll never share your kryptoBird with anyone else.</div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>

    </>
  )
}

export default App
