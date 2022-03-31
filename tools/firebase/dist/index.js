#!/usr/bin/env node
"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var admin = require("firebase-admin");
var commander_1 = require("commander");
var fs = require("fs");
var readline = require("readline");
// Documentation for Commmander can be found here: https://www.npmjs.com/package/commander
var program = new commander_1.Command();
program.version('0.1.0');
program.command('get')
    .alias('g')
    .argument('<flavor>', 'The flavor to get the RemoteConfig template, like kanto or johto. Selects the target Firebase project')
    .argument('<filename>', 'The output file for the template')
    .action(getRemoteConfig);
program.command('validate')
    .alias('v')
    .argument('<flavor>', 'The flavor to validate the RemoteConfig template against.')
    .argument('<filename>', 'The RemoteConfig template json to validate')
    .action(validateRemoteConfig);
program.command('publish')
    .alias('p')
    .argument('<flavor>', 'The flavor to target')
    .argument('<template>', 'The RemoteConfig template file to publish')
    .action(publishRemoteConfig);
program.command('add-rc')
    .addHelpText('before', 'Adds a boolean feature toggle to the remote configs of selected flavor. It defaults to all flavors')
    .alias('a')
    .argument('<name>', 'Name of the feature toggle')
    .argument('<default-value>', 'The default value of the feature toggle')
    .argument('<description>', 'The description of the feature toggle')
    .argument('[flavors]', 'flavors which should be edited, for example "kanto,johto"')
    .action(addRemoteConfigValueForAllFlavors);
program.parseAsync();
function getRemoteConfig(flavorArgument, outFilename) {
    return __awaiter(this, void 0, void 0, function () {
        var serviceAccount, rc, template, templateStr;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    serviceAccount = getServiceAccount(flavorArgument);
                    initApp(serviceAccount);
                    rc = admin.remoteConfig();
                    return [4 /*yield*/, rc.getTemplate()];
                case 1:
                    template = _a.sent();
                    console.log("Received RemoteConfig template for ".concat(serviceAccount.project_id, ". ETag: ").concat(template.etag, "."));
                    templateStr = JSON.stringify(template, null, 2);
                    fs.writeFileSync(outFilename, templateStr);
                    return [2 /*return*/];
            }
        });
    });
}
function validateRemoteConfig(flavorArgument, filename) {
    return __awaiter(this, void 0, void 0, function () {
        var rc, template, e_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    initApp(getServiceAccount(flavorArgument));
                    rc = admin.remoteConfig();
                    template = rc.createTemplateFromJSON(fs.readFileSync(filename, 'utf8'));
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 3, , 4]);
                    return [4 /*yield*/, rc.validateTemplate(template)];
                case 2:
                    _a.sent();
                    console.log("Template has been validated.");
                    return [3 /*break*/, 4];
                case 3:
                    e_1 = _a.sent();
                    console.error('Template is invalid and cannot be published');
                    console.error(e_1);
                    return [3 /*break*/, 4];
                case 4: return [2 /*return*/];
            }
        });
    });
}
function publishRemoteConfig(flavorArgument, templateFilePath) {
    return __awaiter(this, void 0, void 0, function () {
        var serviceAccount, rl;
        var _this = this;
        return __generator(this, function (_a) {
            serviceAccount = getServiceAccount(flavorArgument);
            initApp(serviceAccount);
            rl = readline.createInterface({
                input: process.stdin,
                output: process.stdout
            });
            rl.question("Publishing the template to ".concat(serviceAccount.project_id, ". Are you sure? [y/n] "), function (answer) { return __awaiter(_this, void 0, void 0, function () {
                var _a, rc, template, updatedTemplate, e_2;
                return __generator(this, function (_b) {
                    switch (_b.label) {
                        case 0:
                            _a = answer.toLowerCase();
                            switch (_a) {
                                case 'y': return [3 /*break*/, 1];
                                case 'n': return [3 /*break*/, 6];
                            }
                            return [3 /*break*/, 7];
                        case 1:
                            rc = admin.remoteConfig();
                            template = rc.createTemplateFromJSON(fs.readFileSync(templateFilePath, 'utf8'));
                            _b.label = 2;
                        case 2:
                            _b.trys.push([2, 4, , 5]);
                            return [4 /*yield*/, rc.publishTemplate(template)];
                        case 3:
                            updatedTemplate = _b.sent();
                            console.log("Template ".concat(templateFilePath, " has been published to ").concat(flavorArgument, ", project id: ").concat(serviceAccount.project_id));
                            console.log('ETag from server: ' + updatedTemplate.etag);
                            return [3 /*break*/, 5];
                        case 4:
                            e_2 = _b.sent();
                            console.error('Unable to publish template.');
                            console.error(e_2);
                            return [3 /*break*/, 5];
                        case 5: return [3 /*break*/, 8];
                        case 6:
                            console.log('Aborting.');
                            process.exit(0);
                            return [3 /*break*/, 8];
                        case 7:
                            console.log('Invalid answer! Aborting.');
                            process.exit(0);
                            _b.label = 8;
                        case 8:
                            rl.close();
                            return [2 /*return*/];
                    }
                });
            }); });
            return [2 /*return*/];
        });
    });
}
function getCredentialsFilePath(flavor) {
    var serviceAccountCredentialsPath = '../../firestore_uploader/src/data/' + flavor + "/credentials.json";
    return serviceAccountCredentialsPath;
}
function getServiceAccount(flavorArgument) {
    return require(getCredentialsFilePath(flavorArgument));
}
function addRemoteConfigValueForAllFlavors(name, defaultValue, description, flavorsString) {
    return __awaiter(this, void 0, void 0, function () {
        var flavors, value, _i, flavors_1, flavor;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    flavors = flavorsString.split(',').map(function (val) { return val.trim(); });
                    if (!['true', 'false'].includes(defaultValue.toLowerCase())) {
                        console.warn("".concat(defaultValue, " is not a valid value. Aborting"));
                        process.exit(0);
                    }
                    value = 'true' == defaultValue.toLowerCase();
                    _i = 0, flavors_1 = flavors;
                    _a.label = 1;
                case 1:
                    if (!(_i < flavors_1.length)) return [3 /*break*/, 4];
                    flavor = flavors_1[_i];
                    return [4 /*yield*/, addRemoteConfigValue(flavor, name, value, description)];
                case 2:
                    _a.sent();
                    _a.label = 3;
                case 3:
                    _i++;
                    return [3 /*break*/, 1];
                case 4:
                    console.log('If you need to configure flavor with different values, please do so manually in the JSON files');
                    process.exit(0);
                    return [2 /*return*/];
            }
        });
    });
}
function addRemoteConfigValue(flavor, name, defaultValue, description) {
    return __awaiter(this, void 0, void 0, function () {
        var serviceAccount, app, rc, template, parameter, e_3;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    serviceAccount = getServiceAccount(flavor);
                    app = initApp(serviceAccount);
                    rc = admin.remoteConfig();
                    template = rc.createTemplateFromJSON(loadFromRemoteConfigFolder(flavor));
                    if (template.parameterGroups['feature toggles'] === undefined) {
                        template.parameterGroups['feature toggles'] = {
                            description: "Feature toggles for ".concat(flavor),
                            parameters: {}
                        };
                    }
                    parameter = template.parameterGroups['feature toggles'].parameters;
                    if (parameter !== undefined && parameter[name] !== undefined) {
                        console.warn("A feature toggle with the name ".concat(name, " already exits. Overriding with new values"));
                    }
                    parameter[name] = {
                        'defaultValue': {
                            value: defaultValue.toString(),
                        },
                        'description': description,
                        'valueType': 'BOOLEAN'
                    };
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 3, , 4]);
                    return [4 /*yield*/, rc.validateTemplate(template)];
                case 2:
                    _a.sent();
                    return [3 /*break*/, 4];
                case 3:
                    e_3 = _a.sent();
                    console.error("Template for flavor ".concat(flavor, " is invalid. Aborting."));
                    console.error(e_3);
                    process.exit(0);
                    return [3 /*break*/, 4];
                case 4:
                    writeToRemoteConfigFolder(flavor, template);
                    return [4 /*yield*/, app.delete()];
                case 5:
                    _a.sent();
                    return [2 /*return*/];
            }
        });
    });
}
function loadFromRemoteConfigFolder(flavor) {
    var path = "remote_config/".concat(flavor, ".json");
    return fs.readFileSync(path, 'utf8');
}
function writeToRemoteConfigFolder(flavor, template) {
    var templateStr = JSON.stringify(template, null, 2);
    var path = "remote_config/".concat(flavor, ".json");
    fs.writeFileSync(path, templateStr);
}
function initApp(serviceAccount) {
    return admin.initializeApp({
        credential: admin.credential.cert(serviceAccount)
    });
}
//# sourceMappingURL=index.js.map