# <img src="https://raw.githubusercontent.com/dsbfelipe/readme-banners/main/images/odin-project.png">

<img align="right" src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white">

<br>
<br>

Hangman is a classic word-guessing game where the player must uncover a hidden word one letter at a time. This version runs entirely in the command line and adds a modern twist: the ability to save and reload your game progress at any point.

This project is part of my journey through the Ruby course and deepened my understanding of file handling, serialization, and object-oriented programming (OOP) in a real-world context.

## 📝 Project Objective

The goal of this project was to build a command-line Hangman game where a player plays against the computer. The game loads a large English dictionary, randomly selects a word between 5 and 12 characters long, and challenges the player to guess it before they run out of chances.

Beyond the basic gameplay, I implemented a save/load system so players can pause their game and come back later without losing progress. This was achieved through Ruby’s object serialization capabilities, allowing the game state to be written to a file and restored exactly where the player left off.

## 🔧 Features

- **Random Word Generation**: Loads a list of 10,000 common English words (no swear words!) and picks a secret word between 5 and 12 characters long.

- **Guess Tracking**: Shows how many incorrect guesses are left and which letters have been guessed correctly and incorrectly.

- **Progress Display**: Reveals the word’s current state after each guess (e.g. _ r o g r a _ \_ i n g).

- **Case-Insensitive Input**: Handles guesses smoothly regardless of letter case.

- **Save & Load System**: Players can save the game state anytime and reload it later to continue exactly where they left off.

## 📖 Learnings

- **File Handling & Serialization**: Implemented save/load by serializing the game state to a file and deserializing it when reloading.

- **Ruby Arrays & Strings**: Used array and string manipulation extensively to manage the word display and track guesses.

## 💻 Technologies Used

- **Ruby**: The entire game is built in Ruby, emphasizing OOP design and file I/O.

## 💡 Acknowledgments

- **The Odin Project**: For providing the project outline and guidance.
