Fore more detailed information on WebSockets in UI5 [visit the official documentation](https://sapui5.hana.ondemand.com/#/api/sap.ui.core.ws) or more specific [WebSocket](https://sapui5.hana.ondemand.com/#/api/sap.ui.core.ws.WebSocket%23overview), [PCPWebSocket](https://openui5.hana.ondemand.com/api/sap.ui.core.ws.SapPcpWebSocket#overview).

What is ABAP Push Channel? Refer to this [blog post](https://blogs.sap.com/2013/11/18/websocket-communication-using-abap-push-channels/) or [visit the official documentation](https://help.sap.com/doc/abapdocu_752_index_htm/7.52/de-de/abenapc.htm) for more information. Also: [ABAP JSON](https://blogs.sap.com/2013/07/04/abap-news-for-release-740-abap-and-json/), [ABAP WebSocket Communication](https://blogs.sap.com/2013/07/18/abap-news-for-release-740-abap-channels/), [ABAP Channels](https://help.sap.com/viewer/05d041d3df1a4595a3c45f57c15e2325/7.5.9/en-US/18ef61f6415743658407d4d17f06e950.html). 

Overview of the WebSocket/APC interaction model in ABAP:

![apc](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/apc.jpg)


__The following code snippet does__:

* Decide which URI schema to use
    * WS: for non secure connections (HTTP)
    * WSS: for secure connections (HTTPS)
* Build the respective SAP APC endpoint ```<SAPHost:PORT>/<PathWithinICF>/<APCName>?<specificChannel>```
* Create the WS-Connection
* Attach Event-Listener to 'Open'-Event
    * ... do something
* Attach Event-Listener to 'Message'-Event
    * ... do something

### Code Snippet

```javascript
sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/ws/WebSocket"
], function(Controller, WebSocket) {
    "use strict";

    //global var
    var connection;

return Controller.extend("some.Namespace.controller.Main", {

    onInit: function(){
        //connect to the WebSocket on entry of View
        this._connectToWebSocket();
    },

    _connectToWebSocket: function() {
        var that = this;
        var wsEndpoint;
        //decide Endpoint start (ws/wss)
        if (window.location.protocol === "https:") {
            wsEndpoint = "wss:";
        } else {
            wsEndpoint = "ws:";
        };
        //add SAP Backend APC to complete Endpoint
        wsEndpoint += "//" + window.location.host + "/sap/bc/apc/sap/<ABAPPushChannelName>?channel=something";
        try {
            // create the WS Connection
            connection = new sap.ui.core.ws.WebSocket(wsEndpoint);
            connection.attachOpen(function(oEvt) {
                //Connected to websocket succeed
                console.log(oEvt);
            });
            connection.attachMessage(function(oEvt) {
                //receive message from SAP Backend, transform JSON String into object and make decision
                var someAttribute = JSON.parse(oEvt.getParameter('someAttribute'));
                if  (someAttribute.someValue === someComparison){
                    //Websocket message received 
                    console.log(someAttribute);
                } else {
                    //Message from backend wasn't meant for this application
                };
            }) catch (oErr) {
                //Could not connect to websocket);
                console.log(oErr);
            }
        };
    },
});
```

# Credits

Credits for the information above go to the UI5 and ABAP documentation. As well as the blog posts from [Horst Keller](https://people.sap.com/horst.keller) and [Masoud Aghadavoodi Jolfaei](https://people.sap.com/masoud.aghadavoodijolfaei)

Links: 
* [SAPUI5 WS Documentation](https://sapui5.hana.ondemand.com/#/api/sap.ui.core.ws)
* [ABAP Channels Documentation](https://help.sap.com/viewer/05d041d3df1a4595a3c45f57c15e2325/7.5.9/en-US/18ef61f6415743658407d4d17f06e950.html)
* [ABAP (Push) Channels Documentation](https://help.sap.com/doc/abapdocu_752_index_htm/7.52/de-de/abenapc.htm)
* [ABAP Channels Blog Post](https://blogs.sap.com/2013/11/18/websocket-communication-using-abap-push-channels/)
* [ABAP and WebSocket Blog Post](https://blogs.sap.com/2013/07/18/abap-news-for-release-740-abap-channels/)
* [ABAP and JSON Blog Post](https://blogs.sap.com/2013/07/04/abap-news-for-release-740-abap-and-json/)