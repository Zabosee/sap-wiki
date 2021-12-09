import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sap_wiki/content/ui5_instantiation_content.dart';
import 'package:sap_wiki/pages/module_loading.dart';
import 'package:sap_wiki/pages/sap_fiori.dart';
import 'package:sap_wiki/pages/ui5_folder_structure.dart';
import 'package:sap_wiki/pages/ui5_overview.dart';
import 'package:sap_wiki/pages/ui5_views.dart';

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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
                      builder: (context) => UI5(),
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
