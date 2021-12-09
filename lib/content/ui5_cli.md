## Introduction

In order to work with UI5 like you'd normally work with most of the other JS-frameworks out there (e.g. React, Angular or Vue), SAP introduced the open source UI5 tooling which is capsulated in a [CLI-based](https://de.wikipedia.org/wiki/CLI) tool that helps in developing UI5 application locally. Though I say 'locally' here, the tooling is very open and extensible and can be used in any IDE for example: SAP Web IDE, SAP Business Application Studio or Visual Studio Code.

### Module Overview of the UI5-CLI (tooling):

[[images/ui5ModuleOverviewCLI.png]]

## The Ecosystem

There is an entire ecosystem out there that can help you develop, test and deploy UI5 applications.

* [UI5-Ecosystem Showcase](https://petermuessig.github.io/ui5-ecosystem-showcase/) - [Github](https://github.com/petermuessig/ui5-ecosystem-showcase)
* [UI5 to ABAP Deployer](http://yelcho.github.io/sapui5-deployer/) - [Github](https://github.com/Yelcho/sapui5-deployer)
* [UI5 Scaffolding Generator](https://github.com/SAP/generator-easy-ui5)
* [UI5 App Template Generator](https://preview.npmjs.com/package/@sapui5/generator-sapui5-templates)
* [Official UI5 Tooling Documentation](https://sap.github.io/ui5-tooling/)

## Tooling Architecture

[[images/ArchitectureOverviewUI5Tooling.jpg]]

## Tooling Extensibility

* [Custom Tasks](https://sap.github.io/ui5-tooling/pages/extensibility/CustomTasks/)
* [Custom Server Middleware](https://sap.github.io/ui5-tooling/pages/extensibility/CustomServerMiddleware/)
* [Project Shims](https://sap.github.io/ui5-tooling/pages/extensibility/ProjectShims/)

[[images/ui5CLIExtensibility.png]]

## Tooling Project Types

The project types are configured within the `ui5.yaml` file.  

[[images/ui5YamlProjectTypes.png]]

## Tooling Configuration

The `ui5.yaml` is the configuration file for the UI5 tooling and is necessary in order to work with the CLI. In here there are several different options and settings which you can configure. Be it custom tasks, middlewares or (new with CLI 2.0) the UI5 dependencies.

[[images/UI5Config.png]]

You can even use the UI5 tooling in order to run the built application (usually build into a folder named `dist`) locally. Therefore you just copy the `ui5.yaml` file and rename it to `ui5-dist.yaml` and add the following configuration within the renamed yaml file.

```yaml
resources:
  configuration:
    paths:
      webapp: dist
```

After having added the configuration within the `ui5-dist.yaml` file, you run the CLI with the `--config` flag to change the path to the newly created .yaml file. Without the `--config` flag, the UI5 tooling would always look for standard configuration file (`ui5.yaml`). 

```bash
$> ui5 <command> --config /path/to/ui5-dist.yaml
```

### UI5 CLI 2.0 Dependency Configuration

You no longer add OpenUI5 or SAPUI5 libraries via npm and the respective `package.json` file. Instead you add them via the UI5 CLI. This way the UI5 tooling takes care of downloading the correct dependencies in the background when using commands like `ui5 serve` or `ui5 build`. Custom libraries and other dependencies are still consumed using a node package manager like npm and defined in the projects `package.json`.

* [Why?](https://blogs.sap.com/2020/04/01/ui5ers-buzz-49-the-ui5-tooling-and-sapui5-the-next-step/)

To make use of dependency declaration via the UI5 CLI and the corresponding `ui5.yaml` you have to specify it's `specVersion` to `2.0`.

```yaml
specVersion: '2.2'
metadata:
  name: <projectNameHere>
type: application
```

Before adding the library dependencies the tooling has to know what framework we're using. SAP added two new commands to the CLI to make it easier for us: `ui5 use <framework><version>` and `ui5 add <library>`.

Add framework with specific version `1.76.0`:

```bash
$> ui5 use openui5@1.76

# alternatively get the latest version with:

$> ui5 use openui5@latest
```

Add a few dependencies:

```bash
$> ui5 add sap.ui.core sap.m sap.ui.layout themelib_sap_fiori_3 themelib_sap_belize
```

Result:

Some libraries might be for testing and development purposes only and can be flagged as development. This prevents them from being downloaded, unless the current project is the root project.

```yaml
specVersion: '2.2'
# [...]
framework:
  name: OpenUI5
  version: "1.76.0"
  libraries:
    - name: sap.m
    - name: sap.ui.core
    - name: sap.ui.layout
    - name: themelib_sap_fiori_3
    - name: themelib_sap_belize
      development: true
```

More about the [UI5 Tooling Configuration here](https://sap.github.io/ui5-tooling/pages/Configuration/).

## UI5 Code Completion

Currently there is no 'real' code completion on UI5 for IDEs, but there is a nice workaround for that. You use the typescript npm package of UI5 to get code completion. 

Typescript NPM Package: `@openui5/ts-types`

Configuration for the `tsconfig.json` file:
```json
{
    "compilerOptions": {
        "module": "none",
        "noEmit": true,
        "checkJs": true,
        "allowJs": true,
        "types": ["@openui5/ts-types"]
    }
}
```

alternatively: `jsconfig.json` file:
```json
{
    "typeAcquisition": {
        "include": [
            "@types/openui5"
        ]
    }
}
```
or:
```json
{
    "include": [
        "**/*.js",
        "**/*.json",
        "node_modules/@openui5/ts-types/types"
    ]
}
```
### Example:

[[images/ui5typescriptcodecompletion.png]]

# Disclaimer

Although the SAPUI5 libraries are now generally available via [NPM](https://www.npmjs.com/~sapnaas), due to the license they're distributed under, their usage remains limited/restricted to UI5 applications that will be deployed on SAP Systems only.

# Credits

* The pictures were taken from the SAP Community Call "The UI5 Tooling – a modern CLI-based development experience" on 01.04.2020, hosted by [Peter Muessig](https://twitter.com/pmuessig).
* [Community Call on YT](https://www.youtube.com/watch?v=v6ImEbZRRlg&list=PLpQebylHrdh5XQts8bKoMUKexpun_YPvU)
* [Moving from Eclipse to any IDE(UI5 Tooling)](https://blogs.sap.com/2020/04/04/qa-on-moving-from-eclipse-to-ui5-tooling./)
* [UI5 Tooling](https://sap.github.io/ui5-tooling/)
* [UI5 Tooling on Github](https://github.com/SAP/ui5-tooling/)
* [UI5 CLI](https://sap.github.io/ui5-tooling/pages/CLI/)
* [Manifest Descriptor](https://sapui5.hana.ondemand.com/#/topic/7701636d088147569d99b4f08d418bd9)