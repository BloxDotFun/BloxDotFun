# Blox.Fun - Solana x Roblox Integration

![Project Banner](https://github.com/user-attachments/assets/fa2286ba-43ed-47b2-b260-060565867a28)

A revolutionary integration of blockchain technology and gaming, allowing players to create real Solana tokens through Roblox gameplay and trade them both in-game and on-chain.

## 🌟 Features
- **In-Game Token Minting** - Convert earned Solana (SOL) into real SPL tokens
- **Cross-Platform Trading** - Trade assets seamlessly between Roblox and Solana DEXs
- **Live Market Data** - Real-time price tracking via DexScreener API
- **Blockchain Integration** - Direct Solana RPC connectivity for transactions
- **Dynamic Roblox UI** - Live crypto data displays using Roblox API

## ⚙️ Technologies
![Solana](https://img.shields.io/badge/Solana-3C3C3D?style=for-the-badge&logo=solana)
![Roblox](https://img.shields.io/badge/Roblox-00A2FF?style=for-the-badge&logo=roblox)
![Web3](https://img.shields.io/badge/Web3.js-F16822?style=for-the-badge&logo=web3.js)

- **Solana Blockchain**: Token creation & transaction processing
- **@solana/web3.js**: Blockchain interactions
- **Roblox API**: In-game economy integration
- **DexScreener API**: Real-time market data
- **Solana RPC Nodes**: Blockchain connectivity
- **Roblox Luau**: Game scripting

## 🛠 Tech Stack
**Blockchain Layer**  
![Web3](https://img.shields.io/badge/Web3.js-F16822?style=flat&logo=web3.js)
- Solana Mainnet RPC
- @solana/web3.js 1.90+
- DexScreener API v2

**Game Layer**  
![Luau](https://img.shields.io/badge/Luau-2C2D30?style=flat)
- Roblox Studio 2024+
- Roblox HTTPService
- Phantom Wallet SDK

## 🚀 Installation

```bash
git clone https://github.com/BloxDotFun/solana-roblox-memecoin.git
cd solana-roblox-memecoin
npm install @solana/web3.js axios dotenv
```

### Create ```.env``` File

```
SOLANA_RPC_MAINNET=https://api.mainnet-beta.solana.com
DEXSCREENER_API=https://api.dexscreener.com/latest/dex
ROBLOX_API_KEY=your_roblox_key
PHANTOM_REDIRECT_URI=https://your-game.com/auth
```

## 🔌 Key Integrations

### DexScreener Price Feed
```lua
local function GetTokenPrice(pairAddress)
  return game:GetService("HttpService"):GetAsync(
    "https://api.dexscreener.com/latest/dex/pairs/solana/"..pairAddress
  )
end
```

## Solana RPC Connection

```
import { Connection } from "@solana/web3.js";

const solanaConnection = new Connection(
  process.env.SOLANA_RPC_MAINNET, 
  { commitment: 'confirmed' }
);
```

## 📊 Project Structure

```bash
roblox/
├── assets/           # Game models and components
├── Solana main       # Roblox Intergation
├── Token Creation    # In game Token Creation Logic
├── Vision            # Scripts
└── Web3              # External service Intergration
```

## 🔒 Security Features
Phantom Wallet sandboxing

Transaction pre-simulation

Rate limiting (5 reqs/min)

Input validation:
```
function ValidateTokenName(name)
  return string.match(name, "^%a[%w ]{2,18}$") ~= nil
end
```

## 🚀 Usage Flow
Earn SOL through events

Access developer menu (approved users only)

Submit token creation request:

```
game.ReplicatedStorage.CreateCoin:InvokeServer(
  "MyToken",
  "MTK",
  "My awesome token!",
  "rbxassetid://123456"
)
```

