#!/usr/bin/env node

import 'source-map-support/register'
import * as admin from 'firebase-admin';
import { Command } from 'commander';

const program = new Command();
program.version('0.4.0');

var flavor = process.argv[3];
var serviceAccount = require('../credentials.json');
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

import * as importCollection from './importCollection';

program.command('import <flavor> <file>')
    .alias('i')
    .arguments('[collections...]')
    .option('-a, --auto-id [str]', 'Document ID token specifying auto generated Document ID.', 'Auto-ID')
    .option('-m, --merge', 'Merge Firestore documents. Default is Replace.')
    .option('-p, --coll-prefix [prefix]', '(Sub-)Collection prefix.', 'collection')
    .action((_, fileName, collections, options) => {
        importCollection.execute(fileName, collections, options);
    });

program.parse();