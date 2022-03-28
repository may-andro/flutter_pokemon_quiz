# Purpose

This Firebase tool will be used for working with `RemoteConfig`. The script allows to get, validate and publish `RemoteConfig` templates.

# Setup

- Install the [Node.js & npm](https://github.com/nvm-sh/nvm/blob/master/README.md)
- Install the Firebase CLI:
    - [Firebase CLI](https://firebase.google.com/docs/cli#setup_update_cli)
    - To install CLI via npm use:
  ```
  sudo npm install -g firebase-tools
  ```
- Install the node packages
  ```
  npm install
  ```
- If you need to initialize the project, run the following command to log in via the browser and authenticate the firebase tool
  ```
  firebase login
  ```

# Build

In case you modify the tool, then you need to compile the `.ts` files into `.js`. Use the following command:

```
npm run build
```

# RemoteConfig Management

This tool can access the RemoteConfig configuration of a Firebase project, called the RemoteConfig template.
These templates are stored locally as `json` files at `remote_config`.

## Workflows

#### Adding Feature Toggles

1. Get a template for the flavor you want to change (refer to [Get current RemoteConfig Template](#get-current-remoteconfig-template))
2. Run the command to add a feature toggle to local template (refer to [Adding a Feature Toggle to Local Template](#adding-a-feature-toggle-to-local-template))
3. Validate the modified template (refer to [Validate a Template](#validate-a-template))
4. Publish the valid, modified template (refer to [Publish a Template to Firebase](#publish-a-template-to-firebase))

#### Adding, deleting and updating RemoteConfig values

1. Get a template for the flavor you want to change (refer to [Get current RemoteConfig Template](#get-current-remoteconfig-template))
2. Edit the json template manually (make sure that when you add a value that it is in the correct `parameterGroups` which represents the subfolders)
3. Validate the modified template (refer to [Validate a Template](#validate-a-template))
4. Publish the valid, modified template (refer to [Publish a Template to Firebase](#publish-a-template-to-firebase))


## Get current RemoteConfig Template

Gets the RemoteConfig template for a flavor (e.g. `kanto`). This uses the firebase projects defined by
the `firestore_uploader` tool, check its [README](https://github.com/may-andro/flutter_pokemon_quiz/blob/master/tools/firestore_uploader/README.md) to see which flavors are supported.

> Note: Templates are versioned with an `etag`. If for some reason, someone changes a RemoteConfig value on the UI
> we need to make sure to get the newest template with the updated `etag` before we publish otherwise it won't work

```
npm run rc get <flavor> <output-path>
```

for example:

```
npm run rc get kanto remote_config/kanto.json
```

will use the credentials from `../firestore_uploader/data/kanto/credentials.json`.

## Validate a Template

In order to check if a template is valid, run the following command

```
npm run rc validate <flavor> <template-path>
```

Make sure to use the right flavor, otherwise it might not validate correctly. e.g.:

```
npm run rc validate kanto remote_config/kanto.json
```


## Publish a Template to Firebase

If the template validated correctly, then you can publish it using the following command.

:warning: **Note**: This command affects Production builds

```
npm run rc publish <flavor> <template-path>
```

e.g.

```
npm run rc publish kanto remote_config/kanto.json
```

## Adding a Feature Toggle to Local Template

Running this command only changes the locally available template files. It will write a feature toggle
based on entered parameters to the json files. No changes will be done to production.

To add a `RemoteConfig` value to all of our current supported flavors, run this command:

```
npm run rc add-rc <name> <value> '<description>'
```

To add it to one specifc flavor:

```
npm run rc add-rc <name> <value> '<description>' <flavor> 
```

To add it to multiple flavors (make sure to avoid spaces between the flavors or wrap it in quotes):

```
npm run rc add-rc <name> <value> '<description>' <flavor1>,<flavor2> 
```

e.g:

```
npm run rc add-rc some_feature_toggle true 'this is a description'

npm run rc add-rc some_feature_toggle true 'this is a description' kanto

npm run rc add-rc some_feature_toggle true 'this is a description' kanto,johto 
```


This is a convenience command. All changes to feature toggles can be done manually as well. But this is
currently limited to adding feature toggles only. If you need to configure a feature toggle for a specific
flavor after adding it, you have to do so in the template file manually. Refer to [Adding, deleting and updating RemoteConfig values](#adding-deleting-and-updating-remoteconfig-values) section.
