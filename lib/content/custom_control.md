As we already learned from "[Extending Standard Controls](https://github.com/wridgeu/wridgeu.github.io/wiki/Extend-Standard-Controls)", specific controls can either inherit from the base class __"sap/ui/core/Control"__, or from another control.

In order to create a new custom control we're going to inherit from the base class _[sap/ui/core/Control](https://sapui5.hana.ondemand.com/#/api/sap.ui.core.Control)_. The created control example will be simplified and use the already existing _label_ control as aggregation to display some text. Our control API (metadata) defines the property "value" which we can use in our XML-View to change the displayed text. As visibility of the aggregated label control is defined as hidden, the control acts as "private" to the "outside world". 

## Custom Control Snippet

```javascript
sap.ui.define([
    "sap/ui/core/Control"
], function(Control) {
	"use strict";

	return Control.extend("some.Namespace.projectName.folder.controlName", {

		metadata: {
			properties: {
                value: 	{
                    type : "string", 
                    defaultValue : "Your text here ..."
                }
			},
			aggregations: {
                //visibility hidden means the aggregation is 'private'
                _label : {
                    type : "sap.m.Label", 
                    multiple: false, 
                    visibility : "hidden"
                },
			}
		},

		init: function() {
            //call parent constructor
            Control.prototype.init.call(this);
            //create and set label aggregation
            this.setAggregation("_label", new sap.m.Label({
                text: this.getValue()
            }));
		},
        //implement setter
        setValue: function (sValue) {
            this.setProperty("value", sValue, true);
			//add the text to the actual label
            this.getAggregation("_label").setText(sValue);
		},
        renderer: function(oRM, oCustomControl){
            //render our aggregation into a new div
            oRM.openStart("div", oCustomControl)
            oRM.class("someCSSClassHere");
            oRM.openEnd();
            oRM.renderControl(oCustomControl.getAggregation("_label", oCustomControl)); 
            oRM.close("div")
		} 
	});
});
```

## Using the custom control in our XML View

In order to use a custom control we have to declare an XML-Namespace.

```XML
<!-- create namespace -->
<mvc:View [...]
	xmlns:myNamespace="some.Namespace.ProjectName.FolderWithControls">
```

After having declared the XML-Namespace, we're free to use our control within the XML-View. 

```XML
<!-- usage of namespace/control in View -->
<content>
	<myNamespace:nameOfControl value="some different Text"/>
</content>
```

## How could we make it more 'custom'?

As of now we're reusing an already existing control in our custom control. We could for example use the "[sap.ui.core.HTML](https://sapui5.hana.ondemand.com/#/api/sap.ui.core.HTML)" control in order to embed more custom HTML while benefitting from the capabilities of controls like 'Data Binding'. Or we write our custom HTML within our renderer. As of now, only using different - already existing - controls as aggregation you, could say this is just a "composite control".

For more information about custom controls see the [UI5 documentation](https://sapui5.hana.ondemand.com/#/topic/d12d2ee6a5454d799358d425f9e7c4db).