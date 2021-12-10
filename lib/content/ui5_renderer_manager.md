## About the UI5 Render Manager

More information about the UI5 render manager can be found [here ...](
https://sapui5.hana.ondemand.com/#/api/sap.ui.core.RenderManager)

... or within the [documentation](https://sapui5.hana.ondemand.com/#/topic/91f393916f4d1014b6dd926db0e91070).

### The old way

```javascript
renderer: function(oRM, oCustomControl){
    oRM.write("<div");
    oRM.writeControlData(oCustomControl);
    oRM.addClass("someCSSClass");
    oRM.writeClasses();
    oRM.write(">");
    oRM.renderControl(oCustomControl.getAggregation("_label", oCustomControl));
    oRM.write("</div>");
}
```

__Rendered in HTML__

![CustomControl](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/CustomControl_oRM_Alt.png)

### The new way

```javascript
renderer: function(oRM, oCustomControl){
    oRM.openStart("div", oCustomControl);
    oRM.class("someCSSClassHere");
    oRM.openEnd();
    oRM.renderControl(oCustomControl.getAggregation("_label", CustomControl)); 
    oRM.close("div");
}
``` 

__Rendered in HTML__

![New](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/CustomControl_oRM_Neu.png)

Rendered with small adjustment to `.openStart` method, following a hint in the UI5 Documentation about optimization of the renderer. Here, instead of giving the entire element as second parameter we just hand over the Id where we can add our own suffix.

```javascript
oRM.openStart("div", oCustomControl.getId()+"-suffix")
```

__Rendered in HTML__

![new2](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/CustomControl_oRM_Neu_efficient_DOM_Update.png)

### apiVersion 2 of the Renderer

In order to take advantage of in-place DOM patching use the `apiVersion: 2` which improves the rendering performance massively. UI5 architect Cahit Gürgüc gave a [talk on this at UI5con 2019](https://www.slideshare.net/aborjinik/rendering-evolution-in-ui5) – ever since he implemented it into UI5’s core, `apiVersion: 2` should always be used when developing custom controls! Thanks to [Volker Buzek](https://twitter.com/vobu) for this hint.

```javascript
renderer: {
	apiVersion: 2, //better performance
	render(oRM, oControl){
        oRM.openStart("div", oControl);
        oRM.class("someCSSClassHere");
        oRM.openEnd();
        oRM.renderControl(oControl.getAggregation("_label", CustomControl));
        oRM.close("div");
	}
}
```

## Side by Side comparison

A detailed explanation about the old and new rendering API of the UI5 framework as well as other examples for a custom control using it, can be found [here](https://blogs.sap.com/2020/04/20/ui5ers-buzz-52-the-rendering-evolution-semantic-rendering-and-css-variables/).

![sidebyside](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/sidebysiderenderengine2.png)

### Co-Existance of old and new API

The following picture illustrates a control tree with V2 renderers (new API) and the V1 renderers (old API). While a change of the state of a control using a V2 renderer (dashed border and colored background) only invalidates and updates the DOM of the control, a change to the state of a control using a V1 renderer will also re-render all child controls regardless whether they support DOM patching or not.

![CoExist](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/coexistancerenderengine.png)

# Credits

* [UI5ers Buzz #52](https://blogs.sap.com/2020/04/20/ui5ers-buzz-52-the-rendering-evolution-semantic-rendering-and-css-variables/)
* [Rendering Evolution in UI5](https://www.youtube.com/watch?v=gNYQO3F6M2E)