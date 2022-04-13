# Firebase Cred Builder

A CLI tool which creates and saves the firebase credentials.json on desired path.

## Motivation
The firestore_uploader needs credential.json to upload the data in collections. This tools prepare the credential.json with given input which can be used later by firestore_uploader.

## Usage
Run it with ```dart bin/main.dart -c << credential >> -p << path >>```

For example: ```dart bin/main.dart -c '{"type":"service_account","project_id":"my-project-id","private_key_id":"1a2b3c4d5e6f7g8h9i","private_key":"-----BEGIN PRIVATE KEY-----\nxxx\n-----END PRIVATE KEY-----\n","client_email":"client@email.tld","client_id":"123456789","auth_uri":"https://accounts.google.com/o/oauth2/auth","token_uri":"https://oauth2.googleapis.com/token","auth_provider_x509_cert_url":"https://www.googleapis.com/oauth2/v1/certs","client_x509_cert_url":"https://www.googleapis.com/robot/v1/metadata/x509/my-project-id%40my-project-id.iam.gserviceaccount.com"}' -p ../firestore_uploader/data/credentials.json```

## Further Read
[CLI in Flutter](https://dart.dev/tutorials/server/get-started#3-create-a-small-app)
