
import { confirmTransaction } from './tokenCreation.js';

export async function handleSolanaWebhook(req, res) {
  const { signature, playerId, txId } = req.body;
  
  
  const confirmation = await confirmTransaction(signature);
  
  if (confirmation.value.err) {
    return res.status(400).json({ error: "Transaction failed" });
  }

  
  await fetch(`${process.env.GAME_SERVER}/update-state`, {
    method: "POST",
    body: JSON.stringify({
      playerId,
      txId,
      status: "confirmed",
      tokenAddress: confirmation.meta?.tokenAddress
    }),
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${process.env.GAME_SERVER_KEY}`
    }
  });

  res.status(200).json({ success: true });
}
