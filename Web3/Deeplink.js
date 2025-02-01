import { verify } from '@noble/ed25519';

async function verifyPhantomSignature(signature, publicKey, message) {
  const isValid = await verify(
    signature, 
    new TextEncoder().encode(message), 
    publicKey
  );
  return isValid;
}
