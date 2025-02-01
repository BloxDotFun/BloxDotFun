import { Connection, Transaction } from '@solana/web3.js';
import axios from 'axios';

const SOLANA_RPC = process.env.SOLANA_RPC;

export async function generateCreationRequest(gameData) {

  const connection = new Connection(SOLANA_RPC);
  const tx = new Transaction().add(
  );


  const serializedTx = tx.serialize({
    requireAllSignatures: false,
    verifySignatures: false
  });

  return {
    deeplink: `phantom://v1/connect?redirect_uri=${encodeURIComponent(process.env.REDIRECT_URI)}&tx=${serializedTx.toString('base64')}`,
    txId: tx.signature.toString('base64'),
    expires: Date.now() + 300_000 // 5 minutes
  };
}

export async function confirmTransaction(signature) {
  const connection = new Connection(SOLANA_RPC);
  return connection.confirmTransaction(signature);
}
