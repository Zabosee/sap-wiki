## Overview

Binding paths address the different properties and lists in a model and define how a node in the hierarchical data tree can be found. A binding path consists of a number of name tokens, which are separated by a separator char. In all models provided by the framework, the separator char is the slash `'/'`.

A binding path can either be absolute or relative: Absolute binding paths start with a slash, relative binding paths start with a name token and are resolved relative to the context of the control that is bound. A context exists either for each entry of the aggregation in case of aggregation binding or can be set explicitly for a control by using the setBindingContext method.

Whenever you're using more than one model, specify the model name within the binding path in order to address the correct model. The same applies for setting a binding context for such a model. The binding path must start with the model name followed by a `'>'`.

### Setting a binding Context
```js
//setting Context
oControl.setBindingContext(oContext);
//setting Context with an explicit model name
oControl.setBindingContext(oContext,"myModelName");
```

### Binding with Path
```js
'/Products/0/ProductName'
'/Products(0)/ProductName'
'ProductName'

//with model name
'myModelName>/Products/0/ProductName'
'myModelName>/Products(0)/ProductName'
'myModelName>ProductName'
```

### bindElement vs BindingContext

```js
someObject.setBindingContext(new sap.ui.model.Context(oModel, "/Path"));
```
The difference between those two is conceptual. The Binding Context is used as a parent context for all bindings (for that model) in that Control or its children. It only holds a reference to the used model, (a part of) the path and optional another parent context. It is used when creating relative bindings.

The `bindElement` method on the other hand behaves like every other `bind*` method. It creates a binding (in this case, a `ContextBinding`) which allows change events, data binding, etc. Additionally the created `ContextBinding` also serves as a `BindingContext` for other bindings, just like a Context added with `setBindingContex`t would do.

Reading the code for [ManagedObject](https://github.com/SAP/openui5/blob/757b3ae391270984e400c9d1a518694666fb0fab/src/sap.ui.core/src/sap/ui/base/ManagedObject.js#L2695) might help to understand the internals better. (`bindObject` = `bindElement`)

## Resource Model

The binding path syntax for the resource model only contains a flat list of properties.

* Resource bundle content:
    ```i18n
    CLOSE_BUTTON_TEXT=Close
    OPEN_BUTTON_TEXT=Open
    CANCEL_BUTTON_TEXT=Cancel
    ```

* Binding paths within the model:
    ```i18n
    CLOSE_BUTTON_TEXT
    OPEN_BUTTON_TEXT
    CANCEL_BUTTON_TEXT
    ```

More about  the [Resource Model here.](https://sapui5.hana.ondemand.com/1.36.6/docs/guide/f05c6f2cf18241cbbb2b126989108765.html)

## JSON Model

The JSON model has a simple binding path syntax, because it consists of named objects, such as properties, arrays, or nested objects.

__Note:__ The correct JSON notation uses double quotes for the keys and string values.

```json
{
    "company": {
        "name": "Treefish Inc",
        "info": {
            "employees": 3,
        },
        "contacts": [
            {
                "name": "Barbara",
                "phone": "873"
            },
            {
                "name": "Gerry",
                "phone": "734"
            },
            {
                "name": "Susan",
                "phone": "275"
            }
        ]
    }
}
```

### Absolute binding path within the model

```js
'/company/name'
'/company/info/employees'
'/company/contacts'
```

### Relative binding path within the "`/company`" context

```js
'name'
'info/employees'
'contacts'
``` 

### Relative binding path within an aggregation binding of "`/company/contacts`"

```js
'name'
'phone'
```

More about  the [JSON Model here.](https://sapui5.hana.ondemand.com/1.36.6/docs/guide/d52e364907f94a3caeb4f5e5ad0cf302.html)

## XML Model

XML models differentiate between attributes and content. XML has no arrays and defines lists as multiple elements with the same name instead. This makes the binding path syntax for XML models more difficult than for JSON or OData models.

For attributes, a special selector using the "`@`" character exists and "`text()`" can be used to reference the content text of an element. Lists are referenced by using the path to the multiple element.

__Note:__ For the XML model the root must not be included in the path.

```XML
<companies>
  <company name="Treefish Inc">
    <info>
       <employees>3</employees>
    </info>
    <contact phone="873">Barbara</contact>
    <contact phone="734">Gerry</contact>
    <contact phone="275">Susan</contact>
  </company>
</companies>
```

### Absolute binding paths within this model

```XML
/company/@name
/company/info/employees
```

### Relative binding paths within the "`/company`" context

```XML
@name
info/employees/text()
```

### Relative binding paths within an aggregation binding of "`/company/contact`"

```XML
text()
@phone
```

* __Note:__
  
    In a similar JSON model you would use `/companies/company/locations` as binding path for the locations collection. In an XML model the respective collection binding path is: `/company/locations/location`.

More about the [XML Model here.](https://sapui5.hana.ondemand.com/1.36.6/docs/guide/b8a2c24356c443228f7819d45697a2b8.html)

## OData Model

The OData Model enables binding of controls to data from OData services.

The OData model is a server-side model, meaning that the data set is only available on the server and the client only knows the currently visible (requested) data. Operations, such as sorting and filtering, are done on the server. The client sends a request to the server and shows the returned data.

The OData model is probably the model which undergoes the most changes and improvements over time so I encourage to read up on the various documentations available about the current version of the used OData model.

More about the [Odata Model here.](https://sapui5.hana.ondemand.com/1.36.6/docs/guide/6c47b2b39db9404582994070ec3d57a2.html)

# Credits

I really like the definition & explanation of the standard documentation therefore I decided to 1:1 copy them. This gives myself a better and faster overview whenever I need it.

* [Binding Paths](https://sapui5.hana.ondemand.com/#/topic/2888af49635949eca14fa326d04833b9)
* [Binding Types](https://sapui5.hana.ondemand.com/#/topic/91f0d8ab6f4d1014b6dd926db0e91070)
* [Defining a Binding Path](https://sapui5.hana.ondemand.com/1.36.6/docs/guide/91f0ed206f4d1014b6dd926db0e91070.html)
* [Stackoverflow](https://stackoverflow.com/questions/31283011/whats-the-usage-of-setbindingcontext-and-the-difference-from-element-binding)
* [OData Model v2 - API](https://sapui5.hana.ondemand.com/#/api/sap.ui.model.odata.v2.ODataModel)
* [OData Model v2 - Doc](https://sapui5.hana.ondemand.com/#/topic/6c47b2b39db9404582994070ec3d57a2.html#loio6c47b2b39db9404582994070ec3d57a2)
* [OData Model v4 - API](https://sapui5.hana.ondemand.com/#/api/sap.ui.model.odata.v4.ODataModel)
* [OData Model v4 - Doc](https://sapui5.hana.ondemand.com/#/topic/5de13cf4dd1f4a3480f7e2eaaee3f5b8)
* [OData Model v4 - Spec](http://docs.oasis-open.org/odata/odata/v4.0/)
* [JSON Model - API](https://sapui5.hana.ondemand.com/#/api/sap.ui.model.json.JSONModel)
* [JSON Model - Doc](https://sapui5.hana.ondemand.com/#/topic/96804e3315ff440aa0a50fd290805116.html#loio96804e3315ff440aa0a50fd290805116)
* [XML Model - API](https://sapui5.hana.ondemand.com/#/api/sap.ui.model.xml.XMLModel)
* [XML Model - Doc](https://sapui5.hana.ondemand.com/#/topic/a53e71d85fae4d0887a8b58431197a27.html#loioa53e71d85fae4d0887a8b58431197a27)
* [Resource Model - API](https://sapui5.hana.ondemand.com/#/api/sap.ui.model.resource.ResourceModel)
* [Resource Model - Doc](https://sapui5.hana.ondemand.com/#/topic/91f122a36f4d1014b6dd926db0e91070.html#loio91f122a36f4d1014b6dd926db0e91070)
* [Custom Model](https://sapui5.hana.ondemand.com/#/topic/91f1c7ef6f4d1014b6dd926db0e91070)