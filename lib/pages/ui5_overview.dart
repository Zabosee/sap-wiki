import 'package:flutter/material.dart';
import 'package:sap_wiki/content/ui5_overview_content.dart';
import 'package:url_launcher/url_launcher.dart';

class UI5 extends StatelessWidget {
  const UI5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI5-Overview'),
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
                  Image(
                    image: AssetImage(
                        'assets/images/ui5_overview/ui54dummies.png'),
                  ),
                  Row(
                    children: [
                      Text(subText),
                      TextButton(
                        onPressed: () async {
                          final url = subLink;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not open $url';
                          }
                        },
                        child: Text(subLinkText),
                      ),
                    ],
                  ),
                  Text(title2),
                  Image(
                    image:
                        AssetImage('assets/images/ui5_overview/basicmvc.png'),
                  ),
                  Row(
                    children: [
                      Text(subText),
                      TextButton(
                        onPressed: () async {
                          final url = subLink2;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not open $url';
                          }
                        },
                        child: Text(subLinkText2),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
