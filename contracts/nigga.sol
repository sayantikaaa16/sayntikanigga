// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bombardilo {
    address public owner;
    uint public ticketPrice = 0.01 ether;
    bool public gameActive = true;

    struct Player {
        address playerAddress;
        uint guess;
    }

    Player[] public players;
    uint public winningNumber;
    bool public winnerRevealed = false;

    constructor() {
        owner = msg.sender;
    }

    // Enter the game with a number between 1 and 10
    function enterGame(uint _guess) public payable {
        require(gameActive, "Game not active");
        require(msg.value == ticketPrice, "Send exactly 0.01 ETH");
        require(_guess >= 1 && _guess <= 10, "Guess must be between 1 and 10");

        players.push(Player(msg.sender, _guess));
    }

    // Owner reveals the winning number
    function revealWinner(uint _winningNumber) public onlyOwner {
        require(gameActive, "Game already ended");
        require(!winnerRevealed, "Winner already revealed");
        require(_winningNumber >= 1 && _winningNumber <= 10, "Invalid number");

        winningNumber = _winningNumber;
        winnerRevealed = true;
        gameActive = false;

        // Count winners
        uint winnerCount = 0;
        for (uint i = 0; i < players.length; i++) {
            if (players[i].guess == winningNumber) {
                winnerCount++;
            }
        }

        // If winners exist, split the pot
        if (winnerCount > 0) {
            uint reward = address(this).balance / winnerCount;
            for (uint i = 0; i < players.length; i++) {
                if (players[i].guess == winningNumber) {
                    payable(players[i].playerAddress).transfer(reward);
                }
            }
        } else {
            // If no winner, owner keeps the funds
            payable(owner).transfer(address(this).balance);
        }
    }

    // Allow the owner to start a new game
    function resetGame() public onlyOwner {
        delete players;
        winningNumber = 0;
        winnerRevealed = false;
        gameActive = true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    // View number of players
    function getPlayerCount() public view returns (uint) {
        return players.length;
    }

    // Fallback function to prevent accidental ether transfers
    receive() external payable {
        revert("Use enterGame() to play");
    }
}

