import 'package:flutter/material.dart';
import 'package:sap_wiki/pages/sap_fiori.dart';
import 'package:sap_wiki/pages/ui5_overview.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
