import 'package:flutter/material.dart';
import 'package:sap_wiki/content/sap_fiori_content.dart';
import 'package:url_launcher/url_launcher.dart';

class SAPFiori extends StatelessWidget {
  const SAPFiori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAP-Fiori'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
        foregroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title + '\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Text(
                    subtitle + '\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    q + '\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Text(question1 + '\n'),
                  Text(
                    q2 + '\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Text(question2 + '\n'),
                  Text(
                    title2,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Image(
                    image: AssetImage(
                        'assets/images/Fiori5_Design_Principles.png'),
                  ),
                  Text(
                    title3 + '\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Text(
                    subtitle2 + '\n',
                  ),
                  Text(
                    information,
                  ),
                  TextButton(
                    onPressed: () async {
                      final url = link1;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not open $url';
                      }
                    },
                    child: Text('- ' + link1Text),
                  ),
                  TextButton(
                    onPressed: () async {
                      final url = link2;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not open $url';
                      }
                    },
                    child: Text('- ' + link2Text),
                  ),
                  TextButton(
                    onPressed: () async {
                      final url = link3;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not open $url';
                      }
                    },
                    child: Text('- ' + link3Text),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
