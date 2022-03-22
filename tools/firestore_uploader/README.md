# Purpose

CLI tool for moving data in-n-out of [Cloud Firestore](https://firebase.google.com/docs/firestore/).

# Install

- Clone and run `npm install`
- Download the service account from your Firebase project settings, then save it as `credentials.json` in the project root.
- `npm run build` and you're off and running.

# Usage

## Update data in firestore

### Command templates 
`npm run migrate i <flavor> <filename>`  

### Examples 
` npm run migrate i kanto pokedex_kanto.json`

# Reference
[Jeff Delaney](https://github.com/codediodeio/firestore-migrator)
