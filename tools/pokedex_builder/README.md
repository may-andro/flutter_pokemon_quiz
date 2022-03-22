# Pokedex Builder

A CLI took to prepare the pokedex entries for the app.

## Motivation
The pokemon data is fetched [PokeApi](https://pokeapi.co/docs/v2#pokemon). This tools calls the api for each pokemon and prepares a json structure and saves it in a json file stored at ```pokedex/pokedex_$flavor```

## Usage
Run it with ```dart bin/main.dart -f << flavor >>```

For example: ```dart bin/main.dart -f kanto```

## Further Read
[CLI in Flutter](https://dart.dev/tutorials/server/get-started#3-create-a-small-app)

