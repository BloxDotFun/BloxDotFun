sequenceDiagram
    participant RobloxClient
    participant GameServer
    participant BackendAPI
    participant PhantomWallet
    participant SolanaBlockchain

    RobloxClient->>GameServer: Player creates token (Name, Ticker, Image)
    GameServer->>BackendAPI: Generate unsigned transaction (0.5 SOL fee + metadata)
    BackendAPI->>RobloxClient: Return deeplink URL
    RobloxClient->>PhantomWallet: Open deeplink phantom://tx?data=<base64_tx>
    PhantomWallet->>Player: Sign transaction
    PhantomWallet->>SolanaBlockchain: Broadcast signed transaction
    SolanaBlockchain->>BackendAPI: Transaction confirmation
    BackendAPI->>GameServer: Update game state (new token created)
    GameServer->>RobloxClient: Refresh UI with new token
