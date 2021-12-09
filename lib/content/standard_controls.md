## Introduction

"The base class for all controls in SAPUI5 is __"sap.ui.core.Control"__. To inherit and extend the functionality, specific controls can either inherit from the base class, or from another control." - UI5 Documentation on '[Working with Controls](https://sapui5.hana.ondemand.com/#/topic/91f0a22d6f4d1014b6dd926db0e91070.html)'

After having learned how [classes and objects](https://github.com/wridgeu/wridgeu.github.io/wiki/UI5-Classes-and-Objects) are handled in UI5, learning how to [.extend](https://sapui5.hana.ondemand.com/#/api/sap.ui.base.Object/methods/sap.ui.base.Object.extend) an already existing control will be easier. After all, UI5 controls are just classes themselves. 

Let's take the __"sap.m.Input"__ control as an example and have a quick look into it's [Documentation](https://sapui5.hana.ondemand.com/#/api/sap.m.Input). 

See how the Input control is defined as _class_:

[[images/sapmInputDocumentationDefinition.png]]

# What are Controls made of?

Controls [consist](https://sapui5.hana.ondemand.com/#/topic/91f0a22d6f4d1014b6dd926db0e91070.html) of:

* Control name
  * library name (optional) + control name 
* Control API (metadata)
  * properties
    * automatic generated getter/setter methods
  * events
    * automatic generated attach, detach and fire methods
  * aggregations
  * associations
* Methods
* Renderer
  * also a method (but a "special" one)  

More information about the metadata of a control [here ...](https://sapui5.hana.ondemand.com/#/topic/7b52540d9d8c4e00b9723151622bbb64)

## Control Extension Scaffold

```javascript
sap.ui.define([
	"sap/m/Input"
], function(Input) {
	"use strict";

	return Input.extend("some.Namespace.Folder.ControlExtName", {

		metadata: {
			properties: {
				//some properties
			},
			aggregations: {
				//some aggregations (e.g. Item)
			},
			associations: {
				//some associations (e.g. Label -> Field)
			},
			events: {
				//some event (e.g. onSomething)
			}
		},
		//In the init function that is called by SAPUI5 automatically,
		//whenever a new instance of the control is instantiated
		init: function() {
			//call constructor of parent
			Input.prototype.init.call(this);
			// add and event listener for our own implementation
			this.attachValueHelpRequest(this.onValueHelpRequest);
		},
		//implement our event handling
		onValueHelpRequest: function(oEvent) {
			//maybe fire our own event 'onSomething'		
		},
		
		//onBeforeRendering: function(){}, 
		
		//onAfterRendering: function(){}, 
		
		// declare the use of the standard renderer 
		// from the parent control
		renderer: "sap.m.InputRenderer"

		//exit: function(){} ...
	});
});
```
### Handling an Event in our Control

As seen in the "Control Extension Scaffold"-snippet we can also attach an event listener to already existing events of parent controls and implement the handler ourselves, the specific example would be `.attachValueHelpRequest`.

```javascript
init: function() {
			//call constructor of parent
	Input.prototype.init.call(this);
	// add event listener to the already existing ValueHelpRequest event
	this.attachValueHelpRequest(this.onValueHelpRequest);
},
//implement our handling
onValueHelpRequest: function(oEvent) {
	//maybe fire our own event or use some setter/getter		
},
```

### Firing an Event

In the following example we're firing our event in two different ways. Either by calling the `.fireEvent` or the generated `.fireOurEventNameHere` method. When an event is fired, it usually has some parameters which it passes along.

We can react on those fired events within our XML-View. One prominent example for this would be `onPress(myMethod)` where we implement 'myMethod' within our respective View-Controller to implement something whenever the onPress-Event is fired from the control in use.

```javascript
//control api definition
	metadata: {
		events: {
			ourEvent: {
				"parameterOfEvent": {type: "string"}
			}
		}
	},
// generated method
someMethod: function(oEvt) {
	this.fireOurEvent({
		parameterOfEvent: "someText"
	});
},
// generic method - Event-Id is case sensitive
someMethod: function(oEvt){
	this.fireEvent("ourEvent", {
		parameterOfEvent: "someText"
	})
}
```

### Setting an Aggregation

In the following example we technically inherit from __"sap/ui/core/Control"__, which in this case is just used as example. You'd usually use this inheritance when creating complete custom controls as it is the base class for every control.

```javascript
sap.ui.define([
		"sap/ui/core/Control",
		"sap/m/Button"
	], function(Control, Button){
	return Control.extend("some.Namespace.Folder.controlName", {
		metadata: {
			aggregations: {
				button: {
					type: "sap.m.Button",
					multiple: false,
					visibility: "hidden" 
				}
			},
			events: {
				press: {}
			}
		},

		init: function(){
			//save our context to 'that'
			var that = this;
			//create new button control
			this.oButton = new Button({
				press: function(oEvt){
					that.firePress(oEvt);
				}
			});
			//set instantiated aggregation
			that.setAggregation("button", this.oButton);
		},

		renderer: function(oRm, oCustomControl){
			//render our aggregation:
			oRm.renderControl(oCustomControl.getAggregation("button"));
		}
	})
});
```

### Alternative way of declaring Renderer

The oRM is the "SAPUI5 Render Manager" that can be used to write strings and control properties to the HTML page. Instead of just calling the renderer of our parent, we could add onto it with our own custom HTML.

```javascript
renderer: function(oRM, oInput) {
	//render standard control
	sap.m.InputRenderer.render(oRM, oInput);
	//add more custom html with oRm ...
}
```

More information specifically about the UI5 Render Manager [here ...](https://github.com/wridgeu/wridgeu.github.io/wiki/UI5-Render-Manager)

## Using the extended control in our XML View

In order to use our extended control we have to declare an XML-Namespace.

```XML
<!-- create namespace -->
<mvc:View [...]
	xmlns:myNamespace="some.Namespace.ProjectName.FolderWithControls">
```

After having declared our XML-Namespace, we're free to use the control within the XML-View.

```XML
<!-- usage of namespace/control in View -->
<content>
	<myNamespace:nameOfControl/>
</content>
```

# Full Example of an Extension

The example was mainly taken from a very helpful SAP Community [blog post here](https://blogs.sap.com/2020/02/13/how-to-extend-a-standard-sapui5-control/). His github example app can be found [here](https://github.com/Sagi44/ExtendedSAPUI5Control).