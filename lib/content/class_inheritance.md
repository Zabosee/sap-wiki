To illustrate class inheritance I'll continue with the above example of the _Person_ class. This time however there will be a __Parent__ class from which the "_Person_" class inherits from.

## Parent Class
```javascript
sap.ui.define([
  "sap/ui/base/Object",
  "sap/ui/model/json/JSONModel"
], function(Object,JSONModel) {
  "use strict";
    return Object.extend("some.Namespace.Folder.BaseObject", {
        constructor: function() {
            this.model = new JSONModel();
            this.model.setData(this);
        },
        getModel: function(){
            return this.model;
        }
    });
});
```
In order to use the above mentioned class as __Parent__ class for other classes we will have to extend __this (BaseObject)__ class instead of ["__sap.ui.base.Object__"](https://sapui5.hana.ondemand.com/#/api/sap.ui.base.Object). Besides extending the Parent class we'll also have to _call the constructor_ of the __Parent__ class within the __child__ class.

We do this like so:
```javascript
    nameOfParentClass.call(this);
```

### Short explanation .bind, .call and .apply

To learn more about the JavaScript keywords: .bind, .call and .apply [head over to this article](https://www.taniarascia.com/this-bind-call-apply-javascript/).

Another great resource for getting more in-depth knowledge on JS: [Exploring JS](https://exploringjs.com/es2016-es2017/).

Keyword | Description
--------| ------------
`.bind` | permanent binding of the `this` context to a function/method
`.call` & `.apply` | one time execution of a function/method with bound `this` context
`.call` | (__c__) - __c__ omma separated transfer of arguments like `.call(this, args, ...)`
`.apply`| (__a__) - __a__ rray separated transfer of arguments like `.apply(this, [args, args]`

## Child Class
```javascript
sap.ui.define([
    "some/Namespace/Folder/BaseObject"
], function(BaseObject) {
  "use strict";
    return BaseObject.extend("some.Namespace.Folder.Person", {
        constructor: function(data) {
            BaseObject.call(this);
            if(data){
                this.firstname = data.firstname;
                this.lastname  = data.lastname;
                this.fullname  = this.getFullName();
            }
        },
        getFullName: function(){
            return this.firstname+" "+this.lastname;
        }
    });
});
```
There is no need to have the creation and retrieval of the model within the constructor of the _Person_ class. This is now done within the parent of _Person_. When creating an object of the _Person_ class, it will also have the functions of the Parent class.

## Code in View-Controller
```javascript
onInit:function(){
     this.p = new Person({firstname:"Wouter",lastname:"Lemaire"});
     this.getView().setModel(this.p.getModel(),"person");
}
```

All the properties of the object can be used within the view. It is possible to bind the above mentioned model "person" to the XML-View.

## XML-View Example
```xml
<Input value="{person>/firstname}" editable="false"></Input>
<Input value="{person>/lastname}"  editable="false"></Input>
<Input value="{person>/fullname}"  editable="false"></Input>
```

* __Note:__

    When using class inheritance when working with view-controllers you most likely create a so called 'BaseController' that implements basic (often used) functionality which other view-controllers can inherit from. The 'BaseController' is an abstract controller which won't be instantiated by a view. The methods declared and implemented within the 'BaseController' can be directly used within XML-views that have their respective controllers inherit from the 'BaseController'.

### [Example project for inheritance on Plnkr (forked from Wouter)](http://next.plnkr.co/plunk/mBEk9uBfJxRvRUxGAc2I)