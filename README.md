# Catalog of my things

> Catalog of my things is a console app that will help you to keep a record of different types of things you own: books, music albums, movies, and games. Everything was based on the [UML class diagram](./catalog_of_my_things.png) provided. The data stored in JSON files.


## Built With

- Ruby
- Rspec
- SQL 
- Postgresql

## Video 

[Project presentation video](https://user-images.githubusercontent.com/95243996/189443742-2b8bcda0-c7c3-4ae2-9791-0e5224723355.mp4)


## Getting Started

To get a local copy, follow these simple steps.

### Prerequisites

Web browser installed

### Setup

Cloning a repository

- On GitHub.com, navigate to the main page of the repository;

- Above the list of files, click "Code" button;

- Copy the URL to clone the repository. 

  - To clone the repository using HTTPS : `https://github.com/ElsonOtake/Catalog_of_my_things.git`

  - To clone the repository using an SSH key, including a certificate issued by your organization's SSH certificate authority : `git@github.com:ElsonOtake/Catalog_of_my_things.git`

  - To clone a repository using GitHub CLI : `gh repo clone ElsonOtake/Catalog_of_my_things`

- Open Terminal;

- Change the current working directory to the location where you want the cloned directory;

- Type `git clone`, and then paste the URL you copied earlier.

### Usage

Run the app from the project root using Ruby.

Make sure Ruby is installed on your machine:

```
bash
  ruby -v
```

If it isn't installed, see ruby-lang.org for install instructions for your OS.

From the project root, run:

```
bash
  ruby lib/main.rb
```

The app will start in your terminal and show a welcome message followed by a numbered menu:

```
  Welcome to Catalog of my things App!

  Please choose an option by entering a number:
  0 - Exit
  1 - List all books
  2 - List all music albums
  3 - List all movies
  4 - List all games
  5 - List all genres
  6 - List all labels
  7 - List all authors
  8 - List all sources
  9 - Add a book
  10 - Add a music album
  11 - Add a movie
  12 - Add a game
````

- Enter the number for the option you want and follow the prompts.
- On startup, the app reads existing data from the data/ folder (created automatically on first run if it doesn't exist). Selecting 0 - Exit saves all current data back to data/ before closing.

## Authors

👤 **Andrés Garzon M**

- GitHub: [@githubhandle](https://github.com/andgarzonmal)
- Twitter: [@twitterhandle](https://twitter.com/twitterhandle)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/andres-garzon-maldonado/)

👤 **Elson Otake**

- GitHub: [@elsonotake](https://github.com/elsonotake)
- Twitter: [@elsonotake](https://twitter.com/elsonotake)
- LinkedIn: [elsonotake](https://linkedin.com/in/elsonotake)

👤 **Mauricio Cantillo Moreno**

- GitHub: [@Andyveloper](https://github.com/Andyveloper)
- Twitter: [@MauroCantillo\_](https://twitter.com/MauroCantillo_)
- LinkedIn: [Mauricio Cantillo Moreno](https://www.linkedin.com/in/mauricio-cantillo-moreno/)

👤 **Fabien Brathwaite**

- GitHub: [@fibini](https://github.com/fibini)
- Twitter: [@Onenewpage1](https://twitter.com/Onenewpage1)
- LinkedIn: [Fabien Brathwaite](https://www.linkedin.com/in/fabien-brathwaite/)



## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).


## Show your support

Give a ⭐️ if you like this project!


## Acknowledgments

- Microverse
- W3Schools
- Stack Overflow


## 📝 License

This project is [MIT](./LICENSE) licensed.
