const usedNonces = new Set();

export async function validateRequest(req, res, next) {
  const nonce = req.headers['x-nonce'];
  const timestamp = req.headers['x-timestamp'];
  
  if (usedNonces.has(nonce) || Date.now() - timestamp > 5000) {
    return res.status(403).json({ error: "Invalid request" });
  }
  
  usedNonces.add(nonce);
  next();
