## Introduction

There is a lot of information about creating libraries. Sadly not many are really "up-to-date" therefore you kind of have to work your way through everything and figure out what works best for you. Since I do not cover a custom library in my _playground_ application, I'll list a few examples together with some info-material at the end of this page. Also make sure to take a look at this [repository](https://github.com/wridgeu/UI5-custom-library) and all the information linked there.

## Basic File Structure

This diagram depicts the complete folder structure of a library named "some.lib" containing one control named "SomeControl" (so the full control name is "some.lib.SomeControl") - [from Docs](https://github.com/SAP/openui5/blob/master/docs/controllibraries.md).

```text
some.lib/
+---src/
|   +---some/
|       +---lib/
|           +---themes/
|               +---base/
|                   +---img/
|                       img-RTL/
|                       library.source.less
|                       SomeControl.less
|                   sap_bluecrystal/
|                   +---img/
|                       img-RTL/
|                       library.source.less
|                       SomeControl.less
|           .library
|           library.js
|           messagebundle.properties
|           messagebundle_<any-locale>.properties
|           SomeControl.js
|           SomeControlRenderer.js
+---test/
    +---some/
        +---lib/
            +---SomeControl.html
                qunit/
                +---testsuite.qunit.html
                    SomeControl.qunit.html
                visual/
                +---visual.suite.js
                    SomeControl.spec.js
```

## Basic Steps for Consumption

1. Build & Deploy to application
2. Add new library as dependency of the consumer application
3. (Adjust resourceroots of consuming application to where the library sits)
4. Use custom control in the application:
    * Add XML namespace
    * Use XML namespace+control

## A Few Steps in [Pictures](https://www.slideshare.net/ThomasNelissen/develop-custom-sapui5-libraries-using-sap-web-ide)

Credits to [Flexso Digital](https://www.slideshare.net/ThomasNelissen/develop-custom-sapui5-libraries-using-sap-web-ide).

### 1.
![1](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/createlib1.png)

### 2.
![2](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/createlib2.png)

### 3.
![3](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/createlib3.png)

### 4.
![4](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/createlib4.png)

### 5.
![5](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/createlib5.png)

# Credits:

* [Grunt-Tasks for UI5, Important Task: 'Preload'](https://github.com/SAP/grunt-openui5)
* [Developing Content for UI5 - control-libraries](https://github.com/SAP/openui5/blob/master/docs/controllibraries.md)
* [Create UI5 Lib. for Ui5Lab](https://blogs.sap.com/2018/03/02/create-your-own-ui5-library-for-ui5lab/)
* [Creating a reusable library in UI5 - with WebIDE](https://blogs.sap.com/2018/02/20/creating-a-reusable-library-in-sap-ui5/)
* [Example Library for Flatpickr](https://github.com/StErMi/openui5-flatpickr)
* [UI5Con BE, 2020](https://www.slideshare.net/ThomasNelissen/develop-custom-sapui5-libraries-using-sap-web-ide)