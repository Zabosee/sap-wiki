To implement a singleton in UI5 you have to create a basic class. Instead of returning this class, you have to return a function that creates an instance of your Singleton class. This function will only make a new object/instance of the class the first time (if no instance/object exists). To know if an instance/object is already created, you can use a global variable to keep the active object/instance.

```javascript
sap.ui.define([
  "sap/ui/base/Object",
  "some/Namespace/Folder/Person",
  "some/Namespace/Folder/Skill"
], function(Object,Person,Skill) {
  "use strict";
    var instance;
    var services = Object.extend("some.Namespace.Folder.Services", {
        constructor:function(){
            this.person = {};
            this.skill = {};
        },
        setPerson:function(firstname,lastname){
            this.person = new Person({firstname:firstname, lastname:lastname});
        },
        newSkill:function(skill){
            this.person.addSkill(skill);
        },
        getInitialSkill:function(){
            this.skill = new Skill({name:"name",value:"value"});
            return this.skill;
        }
    });
    return {
            getInstance: function () {
                if (!instance) {
                    instance = new services();
                }
                return instance;
            }
    };
});
```

Usage of the singleton within the UI5 project:

```javascript
services.getInstance();
```

The function `setPerson` will create an object of the Person class. We can access all properties of the singleton instance as follows:

```javascript
services.getInstance().person
```

The function `newSkill` will add a skill to the Person object and the function `getInitialSkill` will create an empty Skill object.