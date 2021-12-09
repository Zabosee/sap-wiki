## Basic Classes & Objects

In order to create a class you have to [.extend](https://sapui5.hana.ondemand.com/#/api/sap.ui.base.Object/methods/sap.ui.base.Object.extend) the component/class ["__sap.ui.base.Object__"](https://sapui5.hana.ondemand.com/#/api/sap.ui.base.Object).
The extended class has a constructor comparable to other languages like ABAP or JAVA for example.

The constructor will be called when you create an object of your class.
```javascript
//create a new object of class myClass
const oNewObject = new myClass(someParameters);
```

Where does the [__sap.ui.base.Object__](https://sapui5.hana.ondemand.com/#/api/sap.ui.base.Object) even come from? Here is an overview of the [class hierarchy](https://qmacro.org/2015/07/14/base-classes-in-ui5/) in UI5:

[[images/baseclasses.png]]

### The `.this` keyword in JS

The `this`-keyword within the class or the class constructor refers to the object itself. Somewhat like `me->` does in ABAP. But be careful, the `this`-keyword means more than that in JS. 

A short but helpful explanation of what the `this`-keyword is (or can be):
* ["The object that is executing the current function"](https://youtu.be/gvicrj31JOM?t=24)

### Private methods in UI5

In JS it isn't really possible to declare functions or attributes as private. To do so you adhere to common development 'standards/best practices'. By prefixing the function or attribute with an __underscore__ you declare it as private. There is no difference to this when developing in UI5.

```javascript
//declare a private method in my class
_someMethod : function(){
    //some code
}
```