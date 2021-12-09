## Introduction

Some examples are based on the official UI5 documentation walkthrough. Check out the following [example application](https://github.com/wridgeu/UI5-testing) for a closer look.

### Testing Pyramid

[[images/testingpyramid.png]]

## Component Tests

### OPA5 - One Page Acceptance

OPA is a set of tools used to automate and validate UI (it comes with backend mocking). Tests are organized in *Journesys*, based on *Pages* to abstract the UI and make the tests more readable. It's designed to test *one* UI5 application (excluding backend testing).

Other automation frameworks like Selenium, Marionette or Puppeteer are framework agnostic, meaning one must rely on the generated HTML to code automation (IDs, CSS selectors...). OPA is designed __by and for__ UI5 developers. It is capable of manipulating UI5 controls.

[[images/integrationtestoverview.png]]

#### Overview of one OPA Test

Quite noticable here is the *Give, When, Then* pattern.

[[images/exampleopatest.png]]

* __Arrangements__ (Given)

    Define possible initial states, e.g. the app is started, or specific data exists. For performance reasons, starting the app is usually done only in the first test case of a journey.

    ```js
    Given.iStartMyApp();
    ```

* __Actions__ (When)

    Define possible events triggered by a user, e.g. entering some text, clicking a button, navigating to another page. 

    ```js
    When.onTheWorklistPage.iPressOnMoreData();
    ```

* __Assertions__ (Then)

    Define possible verifications, e.g. do we have the correct amount of items displayed, does a label display the right data, is a list filled. At the end of the test case, the app is destroyed again. This is typically done only once in the last test case of the journey for performance reasons.

    ```js
    Then.onTheWorklistPage.theTableShouldHaveAllEntries().and.iTeardownMyApp();
    ```

#### Example of one OPA Test

* __Pages__

    Actual page objects that implement actions & assertions per part of the UI or in other words: An OPA5 Page object is used to group and reuse actions and assertions that are related to a specific part of the screen.

    Find an example implementation of a `Page` [here](https://github.com/ArnaudBuchholz/training-ui5con18-opa/blob/master/webapp/test/integration/pages/Filters.js) or [here](https://github.com/wridgeu/UI5-testing/blob/master/webapp/test/integration/pages/Worklist.js).

    ```js
    // Page scaffold (example impl.)
    sap.ui.define([
        "sap/ui/test/Opa5"
    ], function(Opa5){
        Opa5.createPageObjects({
            onAbstractPageName: {
                //baseClass: ClassOfferingCommonHelpers,
                actions: {
                    iExecuteAnAction: function(){ return this.waitFor(/*...*/); },
                    /*...*/
                },
                assertions: {
                    iCheckAnAssertion: function(){ return this.waitFor(/*...*/); },
                    /*...*/
                }
            }
        })
    });
    ```

* __Journeys__

    A journey represents a user’s task in our app. A journey is composed of *tests*. 

  * Each test follows the *Given, When, Then* pattern.
    * Given: setup the initial state of the test
    * When: execute actions
    * Then: check assertions

    Find an example implementation of a `Journey` [here](https://github.com/ArnaudBuchholz/training-ui5con18-opa/blob/master/webapp/test/integration/TodoListJourney.js) or [here](https://github.com/wridgeu/UI5-testing/blob/master/webapp/test/integration/WorklistJourney.js).

    ```js
    // Journey scaffold (example impl.)
    sap.ui.define([
        "sap/ui/test/opaQunit"
    ], function(opaTest){

        //declare module
        QUnit.module("Journey name");

        //test1
        opaTest("Test name", function(Given, When, Then){

            Given.iStartMyapp();

            When.onAbstractPageName.iExecuteAnAction().and.iExecuteAnotherAction();

            Then.onAbstractPageName.iCheckAnAssertion().and.iTeardownTheApp();

        });

        //test2
        opaTest("Test name 2", function(Given, When, Then){
            /*...*/
        })
    })
    ```

#### Loading Pages & Journeys

Here we want to ensure that `qUnit` is loaded, we load the OPA as well as pages & journeys. Finally we start the Test.

Find an example implementation of a `AllJourneys.js` file [here](https://github.com/ArnaudBuchholz/training-ui5con18-opa/blob/master/webapp/test/integration/AllJourneys.js) or [here](https://github.com/wridgeu/UI5-testing/blob/master/webapp/test/integration/AllJourneys.js).

```js
sap.ui.require([
    "sap/ui/test/Opa5",
    /* pages */
    /* journeys */
], function(Opa5){
    Opa5.extendConfig({
        /* Default settings */
    });

    //remove in CI/CD scenario
    QUnit.start();
});
```

#### The MockServer

The MockServer is a software component that captures AJAX requests and either *answers them* or *lets them reach* the backend. Check out the official documentation regarding the MockServer [here](https://openui5.hana.ondemand.com/#/api/sap.ui.core.util.MockServer).

[[images/mockserver.png]]

##### Configuration

* It requires the metadata to know the entities and relationships exposed by the ODATA Service.
* It initializes the entity sets by generating them or loading JSON files.

```js
_oMockServer = new MockServer({ rootUri: "/odata/EXAMPLE_SRV/" });

_oMockServer.simulate("model/metadata.xml", {
    sMockdataBaseUrl: "model/"
});

_oMockServer.start();
```

##### MockServer Entities

MockServer entities can be manipulated at any time.

```js
var aExisting = _MockServer.getEntitySetData("SomeEntitySet");
var sGuid = "0MOCKSVRV-SOME-TEST-MOCK-GUID9999";

// Add a new entity
aExisting.push({
    "Guid": sGuid,
    "Title": "Generated",
    "__metadata": {
        id: "odata/EXAMPLE_SRV/SomeItemSet(guid'" + sGuid + "')",
        uri: "odata/EXAMPLE_SRV/SomeItemSet(guid'" + sGuid + "')",
        type: "EXAMPLE_SRV.SomeItem"
    }
});

_oMockServer.setEntitySetData("SomeItemset", aExisting);
```

##### MockServer Hooks

By default, the MockServer supports a lot of ODATA operations/hooks like: `$batch`, `CRUD`, `Query parameters: paging, filtering, sorting`, `Single-Level Navigation-properties` (function imports aren't supported).

* Definition of a Hook:
  * method: `GET`, `POST`, `PUT` ...
  * path: a regexp matching the API URL
  * response function: behaviour implementation

```js
var aRequests = _MockServer.getRequests();

aRequests.push({
    method: "POST",
    path: OData.entityNames.someItemSet,
    response: function(oXhr){
        //Initialize some values/fields
        var oBody = JSON.parse(oXhr.requestBody);
        oBody[OData.entityProperties.someItem.someAttribute] = null;
        oBody[OData.entityProperties.someItem.someotherAttribute] = null;
        oXhr.requestBody = JSON.stringify(oBody);

        return false; //Keep default processing
    }
});

_oMockServer.setRequests(aRequests);
```

## Unit Tests

[[images/unittestingoverview.png]]

* __Given__

    On the given object we can call arrangement functions like iStartMyAppInAFrame to load our app in a separate iFrame for integration testing.

* __When__

    Contains custom actions that we can execute to get the application in a state where we can test the expected behavior.

* __Then__

    Contains custom assertions that check a specific constellation in the application and the teardown function that removes our iFrame again.

# Credits

* [Example Application](https://github.com/wridgeu/UI5-testing)
* [UI5 Documentation](https://sapui5.hana.ondemand.com/#/topic/291c9121e6044ab381e0b51716f97f52)
* [Cookbook for OPA5](https://sapui5.hana.ondemand.com/#/topic/ce4b180d97064ad088a901b53ed48b21.html)
* [Getting Started](https://sapui5.hana.ondemand.com/#/topic/8b49fc198bf04b2d9800fc37fecbb218.html)
* [Test Automation](https://sapui5.hana.ondemand.com/#/topic/ae448243822448d8ba04b4784f4b09a0.html#loioae448243822448d8ba04b4784f4b09a0)
* [Mock Server](https://sapui5.hana.ondemand.com/#/topic/69d3cbd4150c4ffb884e788f7f60fd93)
* [Test Recorder](https://sapui5.hana.ondemand.com/#/topic/2535ef9272064cb6bd6b44e5402d531d)
* [OPA5](https://sapui5.hana.ondemand.com/#/topic/2696ab50faad458f9b4027ec2f9b884d)
* [QUNIT](https://sapui5.hana.ondemand.com/#/topic/09d145cd86ee4f8e9d08715f1b364c51)
* [SAP Gateway Developer Guide](https://help.sap.com/doc/saphelp_gateway20sp12/2.0/en-US/30/6e8c537c8fcc26e10000000a4450e5/frameset.htm)
* [WaitFor-Method](https://openui5.hana.ondemand.com/#/api/sap.ui.test.Opa5/methods/waitFor)
* [Extended WaitFor Explanation](http://arnaudbuchholz.github.io/decks/UI5Con'18%20A%20journey%20with%20OPA.html#/4/4)
* [OPA Training @Github](https://github.com/ArnaudBuchholz/training-ui5con18-opa)
* [OPA Training from Arnaud Buchholz](http://arnaudbuchholz.github.io/decks/UI5Con'18%20A%20journey%20with%20OPA.html#/)