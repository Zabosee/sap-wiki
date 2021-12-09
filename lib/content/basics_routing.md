## Introduction

Single-page applications based on SAPUI5 can use a so-called “router” to dispatch hash-based URLs to one or more views of the app. Therefore, the router needs to know how to address and show the views. In SAPUI5, we can simply add a routing section to our existing `sap.ui5` section in the descriptor file `manifest.json` to configure the router. 

## Routing Overview

[[images/routingandnavigationpatternmatchingoverview.png]]

## Example App Structure

```text
.
├── ProjectFolder
│   └── webapp
│       ├── controller
│       │   └── App.controller.js
|       |   └── Home.controller.js
│       ├── css
│       ├── i18n
│       ├── view
│       │   └── App.view.xml
|       |   └── Home.view.xml
│       ├── Component.js
│       ├── index.html
│       └── manifest.json
├── package.json
├── readme.md
└── ui5.yaml
```

### There are three properties that can be used to configure the routing of your application:

__config__

This section contains the global router configuration and default values that apply for all routes and targets. The property routerClass is special as it determines the router implementation. The default value is `sap.ui.core.routing.Router`. Here, we set the routerClass to `sap.m.routing`.Router, because we implement an app based on `sap.m`. All other properties in config are given to the router instance. For example, we define where our views are located in the app. To load and display views automatically, we also specify the controlId of the control that is used to display the pages and the aggregation (controlAggregation) that will be filled when a new page is displayed. We will create only XMLviews in this tutorial, so we can set the viewType property to XML. All our views will be available in the view folder of the namespace "someNamespace.projectName", so we can set the viewPath to `someNamespace.projectName.view`. The transition allows us to set a default value for how the transition should happen; you can choose between slide (default), flip, fade, and show. All parameters of the config section can be overruled in the individual route and target definitions if needed.

* __Note:__

    The possible values for routerClass are `sap.ui.core.routing.Router`, `sap.m.routing.Router`, or any other subclasses of `sap.ui.core.routing.Router`. Compared to `sap.ui.core.routing.Router` the `sap.m.routing.Router` is optimized for mobile apps and adds the properties _viewLevel_, _transition_ and _transitionParameters_ which can be specified for each route or target created by the `sap.m.routing.Router`. The transitionParameters can also be used for custom transitions. Please check the [API Reference](https://sapui5.hana.ondemand.com/#/api/sap.m.routing.Router%23overview) for more information.

__routes__

Each route defines a name, a pattern, and one or more targets to navigate to when the route has been hit. The pattern is basically the hash part of the URL that matches the route. The sequence of the routes is important because only the first matched route is used by the router. In our case, we have an empty pattern to match the empty hash. The name property allows you to choose a unique route name that helps you to navigate a specific route or to determine the matched route in one of the matched handlers (we'll explain that in a later step). The target property references one or more targets from the section below that will be displayed when the route has been matched.

* __TLDR:__ You use routes to notify your application that the hash has changed to a certain value. For each route, you define the pattern that can be used in the app implementation.

__targets__

A target defines the view that is displayed. It is associated with one or more routes or it can be displayed manually from within the app. Whenever a target is displayed, the corresponding view is loaded and added to the aggregation configured with the _controlAggregation_ option of the control. This option is configured using _controlId_. Each target has a unique key (home). The viewName defines which view shall be loaded. In our little example, the absolute view path to be loaded for our home target is determined by the default "viewPath": "someNamespace.projectName.view" and "viewName": "Home". This leads to "someNamespace.projectName.view.Home". The viewLevel is especially relevant for flip and slide transitions. It helps the router to determine the direction of the transition from one page to another. (This will also be explained later.) A target can be assigned to a route, but it's not necessary. Targets can be displayed directly in the app without hitting a route.

* __TLDR:__ With targets, you define where a view is loaded and where the view is shown on the UI. By referring to one or multiple targets in a route's definition, you can load and show the views once the route's pattern matches the current hash.

## Example manifest.json configuration

```json
"sap.ui5": {
    "rootView": {
        "viewName": "someNamespace.projectName.view.App",
        "type": "XML",
        "async": true,
        "id": "app"
    },
    "routing": {
        "config": {
            "routerClass": "sap.m.routing.Router",
            "viewType": "XML",
            "viewPath": "someNamespace.projectName.view",
            "controlId": "app",
            "controlAggregation": "pages",
            "transition": "slide",
            "async": true
        },
        "routes": [{
            "name": "appHome",
            "pattern": "",
            "target": ["home"]
        }],
        "targets": {
            "home": {
                "viewType": "XML",
                "viewId": "home",
                "viewLevel": 1,
                "viewName": "Home"
            }
        }
    }
}
```

Basically what we do here is, we define our main view called "App" to be loaded initially when starting up the application, as it is declared as `rootView` within our manifest.json. We then use the routing configuration with an initial (empty) route to display some content. We do this by using the property `controlId` and `controlAggregation`. The Router uses the initial route which points to our second view called "Home" and adds it into to the "App" view or rather into the App control as aggregation of `pages`. Therefore our "Home" view only needs to declare the aggregation `Page` which encapsulates our content. 

## Example App & Home View

__App-View__

```XML
<mvc:View
	controllerName="someNamespace.projectName.controller.App"
	xmlns="sap.m"
	xmlns:mvc="sap.ui.core.mvc"
	displayBlock="true">
	<Shell>
		<App id="app"/> 
        <!--The Home-View will be added into the App-Control via the Router;
        The Routing configuration tells the framework which controlId and which
        controlAggregation it has to 'target' for the placement of the View;
        Home-View implements the <page> and all it's content-->
	</Shell>
</mvc:View>
``` 

__Home-View__

```XML
<mvc:View
   controllerName="someNamespace.projectName.controller.Home"
   xmlns="sap.m"
   xmlns:mvc="sap.ui.core.mvc">
   <Page title="{i18n>homePageTitle}" class="sapUiResponsiveContentPadding">
      <content>
         <Button text="{i18n>iWantToNavigate}" class="sapUiTinyMarginEnd"/>
      </content>
   </Page>
</mvc:View>
```

# Route Patterns

Whenever a hash is added to a URL, the router checks whether there is a route with a matching pattern. The _first_ matching route is taken and the corresponding target view is called (order of definition matters). The data provided with the hash is passed on to the target.

## Different kinds of patterns:

* __Hard-coded pattern:__

    The pattern matches the hash exactly. For example, when a pattern is defined as `product/settings`, this pattern matches only if the hash is `product/settings` and no data is passed on to the events of the route.

* __Route with mandatory parameter:__

    You can define mandatory parameters for the pattern by placing the parameter in curly brackets `{parameter ID}`.

    For example, if you define the pattern `product/{id}`, the hashes `product/5` and `product/3` (where `3` and `5` are product IDs) match the pattern. The matched event handler gets `5` or `3` passed on with the key id in its arguments. But hash `product/` does not match the pattern because the mandatory parameter is missing.

* __Route with optional parameter:__

    You can define optional parameters for the pattern by placing the parameter between colons `:parameter ID:`.

    For example, if you define a pattern `product/{id}/detail/:detailId:`, the `detailId` parameter is optional, whereas `id` is mandatory. Both hashes `product/5/detail` and `product/3/detail/2` match the pattern.

* __Route with query parameter:__

    The query parameter allows you to pass on queries with any parameter. A query parameter starts with `?`, and you can either define it as mandatory `product{?query}` or optional `product:?query:`.

    The matched value will be converted into an object saved with the parameter name as the key when passed to the event handler.

    _Route:_ {parameterName1}/:parameterName2:/{?queryParameterName}

    ```json
    {
        "parameterName1": "parameterValue1",
        "parameterName2": "parameterValue2",
        "?queryParameterName": {
            "queryParameterName1": "queryParameterValue1"
        }
    }
    ```

    Example from the `.navTo` method of the `sap.ui.core.routing.Router` [documentation](https://sapui5.hana.ondemand.com/#/api/sap.ui.core.routing.Router%23methods/navTo).


* __"rest as string" parameter:__

    A parameter that ends with an asterisk `*` is called a "rest as string" parameter. Such a parameter matches as much as possible. It can be combined with the syntax of mandatory or optional parameters.

    For example, a `pattern product/{id}/:detail*:` defines a mandatory parameter with the name `id` and an optional "rest as string" parameter with the name `detail`. It matches `product/5/3` and `product/5/detail/3/foo`. The event handler gets `3` or `detail/3/foo` passed on with the key detail in its arguments.

* __Note:__ SAPUI5 uses Crossroads.js for parsing the hash and the Hasher framework for manipulating the hash.


## Routing Conventions

* Configure the router in the manifest.json descriptor file
* Initialize the router exactly once
* Initialize the router in the component

# Example Application

The repository is [here](https://github.com/wridgeu/UI5-navigation-and-routing).

# Credits

* [UI5-Documentation](https://sapui5.hana.ondemand.com/#/topic/cf3c57c89ef0491793d1ce327ab4f9b2)
* [Initializing the Router](https://help.sap.com/doc/saphelp_uiaddon20/2.05/en-US/ac/db6cd408ec4b9eb5e1fe45e607abdd/content.htm?loaded_from_frameset=true)
* [Routing Configuration](https://help.sap.com/doc/saphelp_uiaddon20/2.05/en-US/90/2313063d6f45aeaa3388cc4c13c34e/content.htm?loaded_from_frameset=true)
* [UI5 Routing & Navigation Walkthrough (Step 9)](https://sapui5.hana.ondemand.com/#/topic/b8561ff6f4c34c85a91ed06d20814cd3)
* [UI5 Routing & Navigation Walkthrough (Step 7)](https://sapui5.hana.ondemand.com/1.36.6/docs/guide/f96d2522a5ca4382a274ae3c6d002ca0.html)
* [UI5 Routing and Navigation Documentation](https://help.sap.com/doc/saphelp_uiaddon20/2.05/en-US/3d/18f20bd2294228acb6910d8e8a5fb5/frameset.htm)
* [UI5 Walkthrough (Step 32)](https://sapui5.hana.ondemand.com/1.32.18/docs/guide/2366345a94f64ec1a80f9d9ce50a59ef.html)
* [Working with multiple Targets](https://help.sap.com/doc/saphelp_uiaddon20/2.05/en-US/2c/5c84d207d246bc9f733f29df1ff892/content.htm?loaded_from_frameset=true)
* [Working with Nested Components](https://help.sap.com/doc/saphelp_uiaddon20/2.05/en-US/2c/66fb3eb775426087401117cfa6a94e/content.htm?loaded_from_frameset=true)
