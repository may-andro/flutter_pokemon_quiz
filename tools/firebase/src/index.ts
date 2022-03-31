#!/usr/bin/env node

import * as admin from 'firebase-admin'
import { Command } from 'commander'
import * as fs from 'fs'
import * as readline from 'readline';

// Documentation for Commmander can be found here: https://www.npmjs.com/package/commander
const program = new Command()
program.version('0.1.0')


program.command('get')
    .alias('g')
    .argument('<flavor>', 'The flavor to get the RemoteConfig template, like kanto or johto. Selects the target Firebase project')
    .argument('<filename>', 'The output file for the template')
    .action(getRemoteConfig)

program.command('validate')
    .alias('v')
    .argument('<flavor>', 'The flavor to validate the RemoteConfig template against.')
    .argument('<filename>', 'The RemoteConfig template json to validate')
    .action(validateRemoteConfig)

program.command('publish')
    .alias('p')
    .argument('<flavor>', 'The flavor to target')
    .argument('<template>', 'The RemoteConfig template file to publish')
    .action(publishRemoteConfig)

program.command('add-rc')
    .addHelpText('before', 'Adds a boolean feature toggle to the remote configs of selected flavor. It defaults to all flavors')
    .alias('a')
    .argument('<name>', 'Name of the feature toggle')
    .argument('<default-value>', 'The default value of the feature toggle')
    .argument('<description>', 'The description of the feature toggle')
    .argument('[flavors]', 'flavors which should be edited, for example "kanto,johto"')
    .action(addRemoteConfigValueForAllFlavors)


program.parseAsync();

async function getRemoteConfig(flavorArgument, outFilename) {
    const serviceAccount = getServiceAccount(flavorArgument)
    initApp(serviceAccount)

    const rc = admin.remoteConfig()
    const template = await rc.getTemplate()
    console.log(`Received RemoteConfig template for ${serviceAccount.project_id}. ETag: ${template.etag}.`)

    const templateStr = JSON.stringify(template, null, 2)
    fs.writeFileSync(outFilename, templateStr)
}

async function validateRemoteConfig(flavorArgument, filename) {
    initApp(getServiceAccount(flavorArgument))

    const rc = admin.remoteConfig()
    const template = rc.createTemplateFromJSON(fs.readFileSync(filename, 'utf8'));

    try {
        await rc.validateTemplate(template)
        console.log(`Template has been validated.`)
    } catch (e) {
        console.error('Template is invalid and cannot be published');
        console.error(e);
    }
}

async function publishRemoteConfig(flavorArgument, templateFilePath) {
    const serviceAccount = getServiceAccount(flavorArgument)
    initApp(serviceAccount)

    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    })

    rl.question(`Publishing the template to ${serviceAccount.project_id}. Are you sure? [y/n] `, async (answer) => {
        switch (answer.toLowerCase()) {
            case 'y':
                const rc = admin.remoteConfig()
                const template = rc.createTemplateFromJSON(fs.readFileSync(templateFilePath, 'utf8'));

                try {
                    const updatedTemplate = await rc.publishTemplate(template)
                    console.log(`Template ${templateFilePath} has been published to ${flavorArgument}, project id: ${serviceAccount.project_id}`)
                    console.log('ETag from server: ' + updatedTemplate.etag)
                } catch (e) {
                    console.error('Unable to publish template.');
                    console.error(e);
                }
                break;
            case 'n':
                console.log('Aborting.');
                process.exit(0);
                break;
            default:
                console.log('Invalid answer! Aborting.');
                process.exit(0);
        }
        rl.close();
    })
}

function getCredentialsFilePath(flavor: string) {
    let serviceAccountCredentialsPath = '../../firestore_uploader/src/data/' + flavor + "/credentials.json"

    return serviceAccountCredentialsPath
}

function getServiceAccount(flavorArgument: string) {
    return require(getCredentialsFilePath(flavorArgument))
}

async function addRemoteConfigValueForAllFlavors(name: string, defaultValue: string, description: string, flavorsString: string) {
    const flavors = flavorsString.split(',').map(val => val.trim());

    if(!['true', 'false'].includes(defaultValue.toLowerCase())) {
        console.warn(`${defaultValue} is not a valid value. Aborting`);
        process.exit(0);
    }

    const value: boolean = 'true' == defaultValue.toLowerCase();

    for (const flavor of flavors) {
        await addRemoteConfigValue(flavor, name, value, description);
    }

    console.log('If you need to configure flavor with different values, please do so manually in the JSON files');
    process.exit(0);
}

async function addRemoteConfigValue(flavor: string, name: string, defaultValue: boolean, description: string) {
    const serviceAccount = getServiceAccount(flavor)
    const app = initApp(serviceAccount)

    const rc = admin.remoteConfig()
    const template = rc.createTemplateFromJSON(loadFromRemoteConfigFolder(flavor));

    if (template.parameterGroups['feature toggles'] === undefined) {
        template.parameterGroups['feature toggles'] = {
            description: `Feature toggles for ${flavor}`,
            parameters: {}
        }
    }

    const parameter = template.parameterGroups['feature toggles'].parameters;

    if (parameter !== undefined && parameter[name] !== undefined) {
        console.warn(`A feature toggle with the name ${name} already exits. Overriding with new values`);
    }

    parameter[name] = {
        'defaultValue': {
            value: defaultValue.toString(),
        },
        'description': description,
        'valueType': 'BOOLEAN'
    };

    try {
        await rc.validateTemplate(template)
    } catch (e) {
        console.error(`Template for flavor ${flavor} is invalid. Aborting.`);
        console.error(e);
        process.exit(0);
    }

    writeToRemoteConfigFolder(flavor, template);

    await app.delete();
}

function loadFromRemoteConfigFolder(flavor: String) {
    const path = `remote_config/${flavor}.json`
    return fs.readFileSync(path, 'utf8')
}

function writeToRemoteConfigFolder(flavor: string, template) {
    const templateStr = JSON.stringify(template, null, 2)
    const path = `remote_config/${flavor}.json`
    fs.writeFileSync(path, templateStr)
}

function initApp(serviceAccount: object): admin.app.App {
    return admin.initializeApp({
        credential: admin.credential.cert(serviceAccount)
    })
}
