import 'dart:ui';

import 'package:flutter/material.dart';
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
import 'package:sap_wiki/pages/shell_component.dart';
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
      // endDrawer: NavigationDrawerWidget(),
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
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShellComponent(),
                    ),
                  );
                },
                child: Text('Shell and ComponentContainer'),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SAPHana(),
                    ),
                  );
                },
                child: Text('SCP/CF & HANA'),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Hana(),
                    ),
                  );
                },
                child: Text('SAP HANA XS'),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
              Divider(
                height: 5,
                thickness: 2,
              ),
              TextButton(
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
