import { useEffect } from 'react'
import detectEthereumProvider from '@metamask/detect-provider'
import Web3 from 'web3'
import Navbar from './components/Navbar'
import KryptoBird from './abis/KryptoBirdz.json'
import './App.css'
import { useState } from 'react'

function App() {

  const [accountDetail, setAccountDetail] = useState({ accounts: null, networkId: null });

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
      return [acc[0], networkId];
    }

    async function call() {
      await LoadWeb3();
      let data = await LoadBlockchainData();
      const updatedAccount = { accounts: data[0] }
      const networkData = KryptoBird.networks[data[1]];
      if (networkData) {
        const abi = KryptoBird.abi;
        const networkDataAdress = networkData.address;
        const contract = new window.web3.eth.Contract(abi, networkDataAdress);
      }
      setAccountDetail(accountDetails=> ({...accountDetails, accounts: data[0]}))
      console.log(accountDetail)
    }

    call();
  }, [])

  return (
    <>
      <Navbar address={accountDetail.accounts} />
      <h1>Vite + React</h1>
      <p className="read-the-docs">
        {accountDetail.accounts}
        Click on the Vite and React logos to learn more
      </p>
    </>
  )
}

export default App
