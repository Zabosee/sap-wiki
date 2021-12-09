## Simple Binding

To reference model data in a view , you can use the simple binding syntax `{/path/to/data}` or `{>/path/to/data}` or `{modelName>/path/to/data}`:

```XML
<Input value="{/firstName}"/>
```

You can add other properties like formatters or data types:

Data type:

```XML
<Input value="{path: '/firstName', type: 'sap.ui.model.type.String'}"/>
```
Formatter:

```XML
<Input value="{path: '/firstName', formatter:'my.globalFormatter'}"/>
```

# Composite Binding

If a control requires data from multiple different model properties, you use a parts array of paths to define composite binding paths:

```XML
<TextField value="{
	parts: [
		{path:'birthday/day'},
		{path:'birthday/month'},
		{path:'birthday/year'}
	], 
	formatter:'my.globalFormatter'}"
/>
```

# Expression Binding (within XML Views)

Expression binding is a simple way to calculate values directly in the view. For example, if you want to change the color of the price depending on whether it is above or below some threshold. With expression binding you don't have to declare a separate formatter:

```XML
<ObjectStatus 
    state=="{= ${products>UnitPrice}  > ${/priceThreshold} ? 'Error' : Success' }"
/>
```

More on it [here](https://sapui5.hana.ondemand.com/#/topic/daf6852a04b44d118963968a1239d2c0.html) or [here.](https://help.sap.com/doc/saphelp_uiaddon10/1.17/en-US/da/f6852a04b44d118963968a1239d2c0/content.htm?no_cache=true)

# Property Metadata Binding for OData Services

With metadata binding, you can bind properties of a control to the corresponding property that is defined in the metadata of an OData service:
```XML
<Input maxLength="{/#Company/ZipCode/@maxLength}"/>
```

# Binding Example Tree-Control

Here "__cv__" is the name of the model. The _parameters_ option stems from the [JSONModel Tree Binding Documentation](https://sapui5.hana.ondemand.com/#/api/sap.ui.model.json.JSONTreeBinding). Some might think because we declared our model within the _items_ property of the Tree-Control, that we don't have to mention the model name within the item itself but you have to. 

Basically it's like telling the Tree-Control where to look for Data (create X-Items for each Data ...). In the item itself you're telling the item which property from the model should be displayed (relative path 'modelName>/').

```XML
<Tree id="cvTree" items="{path: 'cv>/', parameters:{arrayNames: ['nodes']}}">
    <CustomTreeItem>
        <Text renderWhitespace="true" text="{cv>description}"/>
        <Link href="{cv>website}" text="{cv>companie}" target="_blank"/>  <Label text="{cv>position}"/>
        <FlexBox direction="Column">
            <FlexBox direction="Row">
                <Text renderWhitespace="true" text="{cv>textTo}"/>
                <Label text="{cv>to}"/>
            </FlexBox>
            <FlexBox direction="Row">
                <Text renderWhitespace="true" text="{cv>textFrom}"/>
                <Label text="{cv>from}"/>
            </FlexBox>			
        </FlexBox>										
    </CustomTreeItem>
</Tree>
```
# Credits

* [Reference Application](https://github.com/wridgeu/UI5-data-binding)
* [UI5 Documentation - Binding Syntax](https://openui5.hana.ondemand.com/topic/e2e6f4127fe4450ab3cf1339c42ee832)
* [sap.ui.base.ManagedObject.bindObject](https://openui5.hana.ondemand.com/api/sap.ui.base.ManagedObject#methods/bindObject)
* [sap.ui.base.ManagedObject.bindContext](https://openui5.hana.ondemand.com/api/sap.ui.base.ManagedObject#methods/bindContext)
* [sap.ui.base.ManagedObject.attachValidationSuccess](https://openui5.hana.ondemand.com/api/sap.ui.base.ManagedObject#methods/bindContext)
* [JSON Model](https://openui5.hana.ondemand.com/docs/topics/96804e3315ff440aa0a50fd290805116.html)
* [JSONModel API](https://openui5.hana.ondemand.com/api/sap.ui.model.json.JSONModel)
* [Model Binding](https://openui5.hana.ondemand.com/api/sap.ui.model.Binding)
* [Property Binding](https://sapui5.hana.ondemand.com/1.32.9/docs/guide/91f0652b6f4d1014b6dd926db0e91070.html)
* [Property Binding²](https://help.sap.com/doc/saphelp_uiaddon20/2.05/en-US/91/f0652b6f4d1014b6dd926db0e91070/content.htm?no_cache=true)
* [Aggregation Binding](https://sapui5.hana.ondemand.com/1.32.9/docs/guide/91f057786f4d1014b6dd926db0e91070.html)
* [Element Binding](https://sapui5.hana.ondemand.com/1.32.9/docs/guide/91f05e8b6f4d1014b6dd926db0e91070.html)