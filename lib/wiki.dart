import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sap_wiki/content/ui5_instantiation_content.dart';
import 'package:sap_wiki/pages/app_repository.dart';
import 'package:sap_wiki/pages/app_router.dart';
import 'package:sap_wiki/pages/basics_routing.dart';
import 'package:sap_wiki/pages/bundle_custom_control.dart';
import 'package:sap_wiki/pages/cds.dart';
import 'package:sap_wiki/pages/class_inheritance.dart';
import 'package:sap_wiki/pages/components.dart';
import 'package:sap_wiki/pages/credits_classes_object.dart';
import 'package:sap_wiki/pages/credits_ui5_extensibility.dart';
import 'package:sap_wiki/pages/custom_control.dart';
import 'package:sap_wiki/pages/example_class.dart';
import 'package:sap_wiki/pages/full_example.dart';
import 'package:sap_wiki/pages/hana.dart';
import 'package:sap_wiki/pages/module_loading.dart';
import 'package:sap_wiki/pages/not_found_page.dart';
import 'package:sap_wiki/pages/sap_cap.dart';
import 'package:sap_wiki/pages/sap_fiori.dart';
import 'package:sap_wiki/pages/scp_hana.dart';
import 'package:sap_wiki/pages/singleton_pattern.dart';
import 'package:sap_wiki/pages/standard_controls.dart';
import 'package:sap_wiki/pages/ui5_binding_paths.dart';
import 'package:sap_wiki/pages/ui5_binding_syntax.dart';
import 'package:sap_wiki/pages/ui5_classes_objects.dart';
import 'package:sap_wiki/pages/ui5_cli.dart';
import 'package:sap_wiki/pages/ui5_extensibility.dart';
import 'package:sap_wiki/pages/ui5_folder_structure.dart';
import 'package:sap_wiki/pages/ui5_overview.dart';
import 'package:sap_wiki/pages/ui5_render_manager.dart';
import 'package:sap_wiki/pages/ui5_shims.dart';
import 'package:sap_wiki/pages/ui5_testing.dart';
import 'package:sap_wiki/pages/ui5_views.dart';
import 'package:sap_wiki/pages/ui5_websockets.dart';
import 'package:sap_wiki/pages/xmlcomposite_control.dart';

import 'pages/ui5_instantiation.dart';

class WikiPedia extends StatelessWidget {
  const WikiPedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
        foregroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SAPFiori(),
                    ),
                  );
                },
                child: Text('SAP-Fiori'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5(),
                    ),
                  );
                },
                child: Text('UI5-Overview'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5Folder(),
                    ),
                  );
                },
                child: Text('UI5 Folder Structure'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5Instantiation(),
                    ),
                  );
                },
                child: Text('UI5 Instantiation'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5(),
                    ),
                  );
                },
                child: Text('Shell and ComponentContainer'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Module(),
                    ),
                  );
                },
                child: Text('Module Loading'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5Views(),
                    ),
                  );
                },
                child: Text('UI5 Views'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5Syntax(),
                    ),
                  );
                },
                child: Text('UI5 Binding Syntax'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5Paths(),
                    ),
                  );
                },
                child: Text('Binding Paths'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5ClassObj(),
                    ),
                  );
                },
                child: Text('UI5 Classes and Objects'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExampleClass(),
                    ),
                  );
                },
                child: Text('Example of a Class'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClassInheritance(),
                    ),
                  );
                },
                child: Text('Class Inheritance'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullExample(),
                    ),
                  );
                },
                child: Text('Full Example'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingletonPattern(),
                    ),
                  );
                },
                child: Text('Singleton Pattern'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CrClassObj(),
                    ),
                  );
                },
                child: Text('Credits UI5 Classes and Objects'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5Extensibility(),
                    ),
                  );
                },
                child: Text('UI5 Extensibility'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StandardControls(),
                    ),
                  );
                },
                child: Text('Extend Standard Controls'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomControl(),
                    ),
                  );
                },
                child: Text('Create Custom Control'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5RenderManager(),
                    ),
                  );
                },
                child: Text('UI5 Render Manager'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => XMLCompositeControl(),
                    ),
                  );
                },
                child: Text('Create XMLComposite Control'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BundleCustomControl(),
                    ),
                  );
                },
                child: Text('Bundle Custom Controls in a Library'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Components(),
                    ),
                  );
                },
                child: Text('Components'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CrUI5Extensibility(),
                    ),
                  );
                },
                child: Text('Credits UI5 Extensibility'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicsRouting(),
                    ),
                  );
                },
                child: Text('UI5 Basics of Routing'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotFound(),
                    ),
                  );
                },
                child: Text('Not Found Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5Websockets(),
                    ),
                  );
                },
                child: Text('UI5 WebSockets'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5Testing(),
                    ),
                  );
                },
                child: Text('UI5 Testing'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5Cli(),
                    ),
                  );
                },
                child: Text('UI5 CLI'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UI5Shims(),
                    ),
                  );
                },
                child: Text('UI5 Shims'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Hana(),
                    ),
                  );
                },
                child: Text('SCP/CF & HANA'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppRouter(),
                    ),
                  );
                },
                child: Text('SAP App Router'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SAPHana(),
                    ),
                  );
                },
                child: Text('SAP HANA XS'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SAPCap(),
                    ),
                  );
                },
                child: Text('SAP CAP'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CDS(),
                    ),
                  );
                },
                child: Text('CDS'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppRepository(),
                    ),
                  );
                },
                child: Text('HTML5 Application Repository'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
