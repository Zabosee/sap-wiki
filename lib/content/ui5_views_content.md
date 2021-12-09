## Introduction

There are many different "types" of views in UI5. The most common and widely used one, is the XML view.

### Overview of possible View Types

* __XML__: Fiori Wave 2 apps are built with XML views.
* __HTML__:  Fiori Wave 1 apps are built with HTML views.
* __JavaScript__: Many of us start out writing views in JavaScript, partially because it’s the same language we use to build the controllers.
* __JSON__: You can build views declaratively with JSON; it’s not common to see, but intriguing nonetheless, especially when you consider building views programmatically.

Technically you could create a View in UI5 with any of the above mentioned ways. Realistically you'll mostly come across XML Views or (in rare cases) JavaScript Views. 

There has been a blog from [DJAdams](https://people.sap.com/dj.adams) some time ago where he compared the sizes for all UI5 View types. Not only in terms of file-size but also in terms of loading speed (rendering done by the browser) the XML View has 'won'. XML offers you a nice and declarative way for creating your own Views and 'limits' the developer to adhere more strictly to the MVC pattern (instead of being able to code in your View - like with JS-Views). Therefore I personally prefer writing the Views in XML as it also offers a better readability for basically everyone.

Not to mention that XML Views are seen as 'standard' by now. 

# Example XML / JavaScript

If you ever come across a JavaScript View and don't really know what that view would look like in XML or the other way around here is an example. 

### View Result

![Logo](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/viewTypeExample.png)

### View in XML

This is the example XML declaration for creating the View you see above.

```XML
 <mvc:View controllerName="com.mrb.myUI5App.controller.MainView"
	displayBlock="true"
	xmlns="sap.m"
	xmlns:mvc="sap.ui.core.mvc">
	<App id="idAppControl">
        <!--Title can be bound to i18n-->
        <Page title="Greetings">
            <Text text="Hello World" />
            <footer>
                <Bar>
                    <contentRight>
                        <Button text="Edit" />
                    </contentRight>
                </Bar>
            </footer>
        </Page>
	</App>
</mvc:View> 
```

### View in JavaScript

This is the example JavaScript for creating the View you see above.

* __Note:__ There are no intermediate variables declared that hold the different controls, as it is  common in many examples. This is to reduce unnecessary verbosity.

```javascript
sap.ui.define([
	"sap/ui/core/mvc/JSView"
], function (JSView) {
	"use strict";
	sap.ui.jsview("com.mrb.myUI5App.view.MainView", {
        /*Has reference to the view-controller*/
		getControllerName: function () {
			return "com.mrb.myUI5App.controller.MainView";
		},
        /*Title property can be bound to i18n*/
		createContent: function (oController) {
			return new sap.m.App(this.createId("idAppControl"), {
				pages: [
					new sap.m.Page({
						title: "Greetings",
						content: [
							new sap.m.Text({
								text: "Hello World"
							})
						],
						footer: new sap.m.Bar({
							contentRight: new sap.m.Button({
								text: "Edit"
							})
						})
					})
				]
			});
		}
	});
});
```

# Conclusion

This Page is solely for the purpose of having a 1:1 comparison between XML and JavaScript Views, as those two types are the most commonly used ones. Generally it is to say though, that it is recommended to use XML-Views.

# Credits
Credits go to [DJAdams](https://people.sap.com/dj.adams) and one of his [blog posts](https://blogs.sap.com/2013/11/19/mobile-dev-course-w3u3-rewrite-xml-views-an-intro/).