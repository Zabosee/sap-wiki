final String title = 'Overview of App Initialization';
final String subTitle =
    'When a user starts an app (in the SAP Fiori launchpad ( FLP ) or using an HTML page), several steps will be performed in the background.';
final pointText1 = 'Find the official documentation';
final String link =
    'https://sapui5.hana.ondemand.com/#/topic/d2f58695fce3476f92fdfc07c9e8f7c6';
final String linkText1 = 'here';
final pointText2 = 'Basic files of an app';
final String link1 =
    'https://sapui5.hana.ondemand.com/#/topic/28b59ca857044a7890a22aec8cf1fee9.html';
final String pointText =
    'When a user closes the app, the destroy function of the component is called. All models and the router are destroyed. The router will take care of destroying the views.';

final String title2 = 'Instantiating the App';
final String subtitle2 =
    'Some might remember the classic way of Instantiating a UI5 application within the index.html, like this: ';

final String script1 =
    '<script>\n\t\t\tsap.ui.getCore().attach(function () {\n\t\t\t\tsap.ui.require([\n\t\t\t\t\t"sap/ui/core/mvc/XMLView"\n\t\t\t\t], function (XMLView) {\n\t\t\t\t\tXMLView.create({viewName: "nameSpace.testapp"}).then(function (oView) {\n\t\t\t\t\t\toView.placeAt("content");\n\t\t\t\t\t});\n\t\t\t\t});\n\t\t\t});\n</script>';
final String script2Text =
    "It would be played into the body of your index.html file (via it's id) like this:";
final String script2 = '<body class="sapUiBody" id="content"></body>';
final String text =
    "But where did it that go? I just generated my application with it's basic scaffolding via the";
final String link2 = 'https://github.com/SAP/generator-easy-ui5';
final String link2Text = 'Easy UI5 Generator';
final String text2 = "and I can't seem to find this instantiation.";
final String text3 =
    "Thats where the 'bootstrap' in our index.html and the 'Component.js' file comes into play. The application was generated as a component. Imagine that each UI5 application, even standalone applications, are components themselves. Why is that? - Every UI5 application is a component. Because we always extend sap.ui.core.UIComponent in our 'Component.js' file, which extends sap.ui.core.Component.";
final String title3 = 'Bootstrap Example #1 - Component declared in onInit';
final String script3 =
    '<script\n\t\t\tid="sap-ui-bootrstrap\n\t\t\tsrc="/resources/sap-ui-core.js"\n\t\t\tdata-sap-ui-async="true"\n\t\t\tdata-sap-ui-onInit="module:namespace/projectname/Main"\n\t\t\tdata-sap-ui-resourceRoots='
    '{"namespace.projectname": "./"}'
    '>'
    '</script>';
final String title4 = 'Bootstrap Example #2 - Component declared in HTML';
final String script4 =
    '<head>\n\t\t\t<script\n\t\t\t\t\tid="sap-ui-bootstrap"\n\t\t\t\t\tsrc="/resources/sap-ui-core.js"\n\t\t\t\\data-sap-ui-async="true"\n\t\t\t\t\tdata-sap-ui-oninit="module:sap/ui/core/ComponentSupport"\n\t\t\t\t\tdata-sap-ui-resourceroots='
    "'"
    '{"namespace.projectname": "./"}'
    "'"
    '>'
    '\n\t\t\t</script>\n</head>\n<body class="sapUiBody">\n\t\t\t<div data-sap-ui-component\n\t\t\t\t\tdata-name="namespace.testapp"\n\t\t\t\t\tdata-id="container"\n\t\t\t\t\tdata-settings='
    "'"
    '{"id" : "testapp"}'
    "'"
    '>'
    '\n\t\t\t</div>\n</body>';
final String text4 =
    'What we see here (example #2) is a (on startup of the application instantiated) component which was directly declared within the div-Tag of our HTML (with custom attributes '
    'data-*'
    '). The bootstrap attribute data-sap-ui-oninit="module:sap/ui/core/ComponentSupport" is used to enable this feature called';
final String link3 =
    'https://sapui5.hana.ondemand.com/#/topic/82a0fcecc3cb427c91469bc537ebdddf.html';
final String link4Text = 'declarative component support';
final String text5 =
    'which alloes us to place our component directly into HTML.';
final String clickText = "here";
final String here1Link = '';
final String here2Link = '';
final String click = 'for more information about this bootstrap attributes.';
final String text6 =
    'Our div here is quite similar to the ones in the perspective';
final String link5Text = 'UI5 Documentation';
final String link5 =
    'https://sapui5.hana.ondemand.com/#/topic/82a0fcecc3cb427c91469bc537ebdddf.html';
