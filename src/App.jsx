import { useEffect } from 'react'
import detectEthereumProvider from '@metamask/detect-provider'
import Web3 from 'web3'
import KryptoBird from './abis/KryptoBirdz.json'
import './App.css'

function App() {

  let accounts;
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
      console.log(await window.web3);
      const acc = await window.web3.eth.getAccounts();
      return acc;
    }

    async function call() {
      const x = await LoadWeb3();
      accounts = await LoadBlockchainData();
      console.log(accounts);
    }
    call();
  })

  return (
    <>
      <h1>Vite + React</h1>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </>
  )
}

export default App
