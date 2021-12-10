## Introduction

Sometimes it is important to display an indication that the requested resource was not found. To give you an example: If a user tries to access an invalid pattern which does not match any of the configured routes, the user is notified that something went wrong. You might also know this as a “404” or Not Found Page from traditional web pages.

## Example manifest.json configuration

To let our router know, that we have a fallback view we have to add the `bypassed` property to the router configuration. Here we simply tell our router which view we want to show in case a route is not matched/invalid. We do this by adding a target which we have defined within the `targets` section.

```json
"sap.ui5": {
    "routing": {
        "config": {
            "routerClass": "sap.m.routing.Router",
            "viewType": "XML",
            "viewPath": "someNamespace.projectName.view",
            "controlId": "app",
            "controlAggregation": "pages",
            "transition": "slide",
            "bypassed": {
				"target": "notFound"
			},
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
            },
            "notFound": {
                "viewType": "XML",
                "viewId": "notFound",
                "viewName": "NotFound",
                "transition": "show"
            }
        }
    }
}
```

## Example XML View for Not Found pages
```XML
<mvc:View
   controllerName="someNamespace.projectName.controller.NotFound"
    xmlns="sap.m"
    xmlns:mvc="sap.ui.core.mvc">
    <MessagePage
      title="{i18n>NotFound}"
      text="{i18n>NotFound.text}"
      description="{i18n>NotFound.description}"
      showNavButton="true"
	  navButtonPress="onNavBack"/>
</mvc:View>
```

## Example Implementation of `onNavBack`

For this implementation we're using a 'BaseController' in order to benefit from the DRY principle (don't repeat yourself!). 

* __Note:__ 
    Our base controller is an abstract controller that will not be instantiated in any view. Therefore, the naming convention `*.controller.js` does not apply, and we can just call the file BaseController.js. By not using the naming convention `*.controller.js` we can even prevent any usage in views.

* __Note:__ 
    We have the method `onNavBack` implemented within our BaseController and therefore don't need to call it within our NotFound-View-Controller as long as this Controller inherits and extends from the BaseController, leaving us with less repetitive work. And making it possible to just declaratively use the `onNavBack`-Method within our XML-View. 

```javascript
sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/routing/History",
    "sap/ui/core/UIComponent"
], function (Controller, History, UIComponent) {
    "use strict";

    return Controller.extend("someNamespace.projectName.controller.BaseController", {

        getRouter: function () {
            return UIComponent.getRouterFor(this);
        },

        onNavBack: function () {
            var oHistory, sPreviousHash;

            oHistory = History.getInstance();
            sPreviousHash = oHistory.getPreviousHash();
            //Either use browser History-API or custom Logic (App Routes)
            if (sPreviousHash !== undefined) {
                window.history.go(-1);
            } else {
                //"appHome" is the name of our Route which leads to the Home-View
                this.getRouter().navTo("appHome", {}, true /*no history*/);
            }
        }

    });
});
``` 

## How would this look?

If we now enter a URL that's invalid and therefore can't be matched to any route for example:
```url
http://<someHost>:<Port>/index.html#/somethingInvalidAfterTheHash
```
... we display the following view:

![NotFound](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/notFoundPageExample.png)

## Conventions
* Always configure the bypassed property and a corresponding target
* Use the sap.m.MessagePage control to display routing related error messages
* Implement a global onNavBack handler for back navigation in your app
* Query the history (Browser History-API) and go to the home page if there is no history available for the current app