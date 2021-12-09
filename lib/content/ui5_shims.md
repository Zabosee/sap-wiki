## What is a Shim?

Find the proper explanation here in [wikipedia](https://de.wikipedia.org/wiki/Shim_(Informatik)). In short a Shim is a compatibility extension to enable you to use newer, more advanced features, functions or tools in your current project environment. Another word for Shim would be [Polyfill](https://en.wikipedia.org/wiki/Polyfill_(programming)) although not completely the same they both exist for the same reason ~ "a polyfill is a shim for a browser API".

Within this documentation I'll be demonstrating one of the most recurring use-cases for Shims in UI5: 

* Including an external library that you've pulled into your project either via `npm` (node_modules) or manually into a `libs`-folder within your application (pre-build library).

## Manual - Library Shim

Imagine our project structure being like the following.

```text
.webapp
├── controller
│   ├── Base.js
│   ├── Home.controller.js
├── css
│   └── style.css
├── i18n
├── libs
│   └── marked.min.js
├── model
├── resources
├── util
│   └── marked.js
├── view
│   ├── Home.view.xml
├── Component.js
├── index.html
└── manifest.json
```

Important is that we've pulled our external library, here [marked.js](https://marked.js.org/#/README.md#README.md), manually into our project (the `libs` folder). It is a minified, pre-build version of the library. Physically our external library now 'sits' in our application but we cannot use it yet. We need a way to pull in the dependency at runtime and get access to the object of the library in order to use it.

We do this by configuring the `sap.ui.loader` within our `component.js` file. I chose to do this within the `component.js` file to have configuration steps on a central point of my application. You could also just do this right before actually defining the dependency within your respective controller or other files.

The path to the library consists of `<namespace.projectname.folder.file>` it's a mapping to the virtual path within the application at runtime. The value of `exports` has to match the object that is being exported by the library. For example for the library [highlight.js](https://highlightjs.org/) it's not just `highlight`, it's actually `hljs` => `{exports: "hljs"}`.

Check out the [sap.ui.loader namespace](https://openui5.hana.ondemand.com/api/sap.ui.loader).

```js
sap.ui.loader.config({
    async: true,
    shim: {
        "sapmarco/projectpages/libs/marked.min": {
            amd: true,
            exports: "marked",
        }
    },
});
```

In order to consume the library you just use `sap.ui.define` as you're used to.

```js
sap.ui.define(["sapmarco/projectpages/libs/marked.min"], function (Marked) {
    "use strict";

    Marked.setOptions({
        highlight: function (code, lang) {
            //do something in here
        }
    });
});
``` 

## UI5-Tooling - Project-Shim

Imagine our project structure being like the following. 

```text
.webapp
├── controller
│   ├── Base.js
│   ├── Home.controller.js
├── css
│   └── style.css
├── i18n
├── model
├── resources
├── util
│   └── marked.js
├── view
│   ├── Home.view.xml
├── Component.js
├── index.html
└── manifest.json
package.json
ui5.yaml
```
What changed? We're not longer required to use a custom prebuild library file within a `libs` folder. Instead we make use of the `package.json` file and the UI5-Tooling with it's configuration file, the `ui5.yaml`.

The `package.json` not only holds references to our application dependencies, in here we also have a "ui5 dependency array". This array is filled with dependencies that should be known to the UI5-Tooling. Whether or not the tooling is picking those dependencies up can be checked with the `ui5 tree` command in your console.

```json
"dependencies": {
        "marked": "^1.1.0",
},
"ui5": {
        "dependencies": [
                "marked",
        ]
}
``` 

The following is an example configuration for the [marked.js](https://marked.js.org/#/README.md#README.md) library. You can find another example for [lodash](https://lodash.com/) [here](https://sap.github.io/ui5-tooling/pages/extensibility/ProjectShims/#example-a).

```yaml
---
specVersion: "2.2"
type: project-shim
metadata:
  name:  projectpages.thirdparty
kind: extension
shims:
  configurations:
    marked: # name of module as in package.json
      specVersion: "2.2"
      type: module
      metadata:
        name: marked
      resources:
        configuration:
          paths:
            /resources/thirdparty/marked/: "" # virtual path mapping
```

In order to consume the library you just use `sap.ui.define` as you're used to. Beware that your parameter inside the following function will just be a placeholder as you're using the actual object of the library and none that get's imported due to declaring & loading the dependency here. Example: parameter of our function is called `markedjs` at runtime however this will be undefined and we will have access to the actual `marked` object from the library.

The path of the library within the `node_modules` folder is mapped to the `/resources/thirdparty/marked` path at runtime. Inside this folder we can look for our library file `marked.min` the `.js` gets appended by the framework when requiring it.

Check out [Path Mapping of Modules](https://sap.github.io/ui5-tooling/pages/Configuration/#path-mapping-of-modules) as the "Project-Shim" we're using here is also of type `module`.

```js
sap.ui.define(["thirdparty/marked/marked.min"], function (markedjs) {
    "use strict";

    marked.setOptions({
        highlight: function (code, lang) {
            //do something in here
        }
    });
});
``` 

# Credits

* [UI5 Tooling Documentation](https://sap.github.io/ui5-tooling/pages/extensibility/ProjectShims/)
* [Example Configuration for UI5.yaml](https://sap.github.io/ui5-tooling/pages/extensibility/ProjectShims/#example-a)
* [UI5 Tooling RFC 0002 Project Shims](https://github.com/SAP/ui5-tooling/blob/master/rfcs/0002-project-shims.md)
* [Example Application with Tooling based Project-Shim](https://github.com/exxcellent/ui5tooling-extensibility-showcase/tree/master/demos/ui5tooling-projectshim)
* [UI5-Loader Config. example for Library-Shimming](https://github.com/christianp86/Trasta/blob/master/webapp/controller/Home.controller.js) by [Chrstian Pfisterer](https://github.com/christianp86)
* [UI5-Loader Config. + Project-Shim Example (Library Shimming)](https://github.com/wridgeu/github_pages/commit/81fe853b06bc5bc7bf7aae0996a9692e241ee032)