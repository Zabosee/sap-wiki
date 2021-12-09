There will be multiple values from two input fields that will be stored within a table. Theres the object "Person" which has one or more "Skills". In the example you can add different Skills to a Person.

The inheritance will look like this:

* BaseClass<-Person
* BaseClass<-Skill
* View-Controller [.extend](https://sapui5.hana.ondemand.com/#/api/sap.ui.base.Object/methods/sap.ui.base.Object.extend) ["__sap.ui.core.mvc.Controller__"](https://sapui5.hana.ondemand.com/#/api/sap.ui.core.mvc.Controller) and uses the Classes Person and Skill

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
        getModel:function(){
            return this.model;
        }
    });
});
```
## Child Class - Person

The _Person_ class will inherit from the _Parent_ class. It will also have a function to add skills to the _Person_ object. After adding a skill, it will have to update the model with the [refresh function](https://sapui5.hana.ondemand.com/#/api/sap.ui.model.Model%23methods/refresh). 

The [_refresh_]((https://sapui5.hana.ondemand.com/#/api/sap.ui.model.Model%23methods/refresh)) function itself comes from "__sap.ui.model.Model__" which is an abstract base class for model objects. Description for the method: "This will check all bindings for updated data and update the controls if data has been changed." 
This could probably be replaced with the 'observe'-property of JSONModels, which is currently still marked as experimental.

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
                this.lastname = data.lastname;
                this.fullname = this.getFullName();
            }
            this.skills = [];
        },
        getFullName:function(){
            return this.firstname+" "+this.lastname;
        },
        addSkill:function(skill){
            this.skills.push(skill);
            this.model.refresh();
        }
    });
});
```

The Skill class holds the _name_ and _value_ attributes and inherits from the Parent class.

## Child Class - Skill
```javascript
sap.ui.define([
    "some.Namespace/Folder/BaseObject"
], function(BaseObject) {
  "use strict";
  return BaseObject.extend("some.Namespace.Folder.Skill", {
      constructor: function(data) {
        BaseObject.call(this);
        if(data){
            this.name = data.name;
            this.value = data.value;
        }
      }
    });
});
```

The model can now be used within the view. Therefore you have to bind it in the respective view-controller. 

## Code in View-Controller
```javascript
sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "some.Namespace/Folder/Person",
    "some.Namespace/Folder/Skill"
], function (Controller, JSONModel, Person, Skill) {
    "use strict";

    return Controller.extend("some.Namespace.views.main", {
      
        onInit:function(){ 	
            //bind person object this.p to view as model "person"
            this.p = new Person({firstname:"Wouter",lastname:"Lemaire"});
            this.getView().setModel(this.p.getModel(),"person");
            //bind skill object this.s to view as model "skill"
            this.s = new Skill({name:"name",value:"value"});
            this.getView().setModel(this.s.getModel(),"skill");
        },
        addSkill: function() {
            //add skill (pushes new skill object to skill-array and refresh the model)
            this.p.addSkill(this.s);
            //create new empty skill object and bind it 
            this.s = new Skill({name:"name",value:"value"});
            this.getView().setModel(this.s.getModel(),"skill");
        }
    });
});
```

### [Example project for the 'FULL' example on Plnkr (forked from Wouter)](http://next.plnkr.co/plunk/2F14DX7zA3tqnPrh)