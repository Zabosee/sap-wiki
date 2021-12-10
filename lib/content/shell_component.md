## Instantiation like in [UI5 Overview](https://github.com/wridgeu/wridgeu.github.io/wiki/UI5-Overview)

[__Shell__](https://sapui5.hana.ondemand.com/#/api/sap.m.Shell) : "The Shell control can be used as root element of applications. It can contain an [App](https://sapui5.hana.ondemand.com/#/api/sap.m.App) or a [SplitApp](https://sapui5.hana.ondemand.com/#/api/sap.m.SplitApp) control. [...]"

[__ComponentContainer__](https://sapui5.hana.ondemand.com/#/api/sap.ui.core.ComponentContainer): "Container that embeds a UIComponent in a control tree."

Which file takes care of what?

* Index.html: _Shell_ -> _ComponentContainer_
* Component.js: _rootElement_ -> _rootView_

This way we create the Shell and the ComponentContainer ourselves and place them into our HTML Body-Tag. 

```javascript
<script>
    sap.ui.getCore().attachInit(function () { 
        new sap.m.Shell({ 
            app: new sap.ui.core.ComponentContainer({ height: "100%", name: "someName" }) 
            }).placeAt("content");
        });
</script>
```
[See another example here ...](https://help.sap.com/doc/saphelp_uiaddon20/2.05/en-US/4d/f1d914e52d4b1aa0805eb01522537e/content.htm?no_cache=true)

The Body-Tag:

```html
<body class="sapUiBody" id="content"></body>
```

After having done that, we create our _rootElement_ ([sap.m.App](https://sapui5.hana.ondemand.com/#/api/sap.m.App)) within our Component.js in which we then put our _rootView_ (from the manifest.json).

```javascript
//simplified Component.js
sap.ui.define([
	"sap/ui/core/UIComponent",
], function(UIComponent) {
	"use strict";

	return UIComponent.extend("namespace.testapp.Component", {
		metadata: {
			manifest: "json"
		},

		init: function() {
			// call the base component's init function
			UIComponent.prototype.init.apply(this, arguments);
			// enable routing
			this.getRouter().initialize();
		},
        //create rootElement 'App'
        createContent: function(){
            return new sap.m.App({id: "someId"});
        }
	});
});
```