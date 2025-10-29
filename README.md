<img width="1612" height="923" alt="image" src="https://github.com/user-attachments/assets/02cdb463-390a-4911-b560-e3d8ea43cd79" />

🎯 Bombardilo — A Simple Lottery-Style Number Prediction Game

Contract Address: 0x7f2b7c8aa19167a75309733da049dde73571f60d
Network: (add the network you deployed on — e.g. Sepolia Testnet / Polygon Mumbai)

🧩 Overview

Bombardilo is a beginner-friendly Solidity smart contract that allows players to join a simple number prediction game.
Players choose a number between 1–10, pay a small entry fee, and wait for the game owner to reveal the winning number.
If their prediction matches, they share the prize pool!

⚙️ Features

🎟️ Join the game by paying a fixed entry fee (0.01 ETH).

🔢 Guess a number between 1 and 10.

🏆 Owner reveals the winning number.

💰 Winners are rewarded automatically from the contract balance.

🔁 Owner can reset the game and start a new round.

📜 Smart Contract Functions
Function	Description	Access
enterGame(uint guess)	Player joins the game with their guess (1–10) by paying 0.01 ETH.	Public
revealWinner(uint winningNumber)	Reveals the winning number and distributes rewards.	Only Owner
resetGame()	Clears all players and restarts the game.	Only Owner
getPlayerCount()	Returns the number of current players.	Public View
💻 How to Use (on Remix)

Go to Remix IDE
.

Create a new file named Bombardilo.sol and paste the contract code.

Compile using Solidity 0.8.x.

Deploy it (you become the owner).

Players use enterGame(guess) to play by sending 0.01 ETH.

Once entries close, call revealWinner(winningNumber) to pick a winner.

To start over, call resetGame().

🧠 Logic Flow

Each player submits a number between 1–10 with a fixed entry fee.

The owner later reveals a winning number.

All players who guessed correctly share the total balance equally.

If no one wins, the owner receives the remaining balance.

🔒 Notes & Limitations

The current version uses a manual winning number (chosen by the owner).

For fairness, you can later integrate Chainlink VRF for random number generation.

Always test on a testnet before deploying to mainnet.

Gas costs depend on the number of players.

🧱 Future Improvements

Use Chainlink VRF for random number generation.

Add a time-based game end (automatic reveal after a deadline).

Add UI to allow non-technical users to play easily.

Store game history on-chain for transparency.

📬 Contact / Ownership

Project: Bombardilo

Owner Wallet: 0x7f2b7c8aa19167a75309733da049dde73571f60d

Developer: (add your name / GitHub / Twitter handle here if you like)
