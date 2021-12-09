The example shows a class named "Person". It extends the UI5 base object ["__sap.ui.base.Object__"](https://sapui5.hana.ondemand.com/#/api/sap.ui.base.Object). 

It consists of:
* constructor
* attributes (model; first-, last- and fullname)
* methods (functions: getFullName and getModel)

```javascript
sap.ui.define([
  "sap/ui/base/Object",
  "sap/ui/model/json/JSONModel"
], function(Object, JSONModel) {
  "use strict";
    return Object.extend("some.Namespace.Folder.Person", {
        constructor: function(data) {
            if (data) {
                this.firstname = data.firstname;
                this.lastname  = data.lastname;
                this.fullname  = this.getFullName();
            }
            this.model = new JSONModel();
            this.model.setData(this);
        },
        getFullName: function() {
            return this.firstname + " " + this.lastname;
        },
        getModel: function() {
            return this.model;
        }
    });
});
```
Reminder what the [_.extend_](https://sapui5.hana.ondemand.com/#/api/sap.ui.base.Object/methods/sap.ui.base.Object.extend) method actually takes in as arguments:
* __sClassName__ - _string_ - name of the class to be created
* __oClassInfo?__ - _object_ - structured object with information about the class
* __FNMetaImpl?__ - _function_ - constructor function for the metadata object. If not given, it defaults to sap.ui.base.Metadata.

[[images/extend.png]]