import 'package:flutter/material.dart';
import 'package:sap_wiki/content/ui5_instantiation_content.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_widget/zoom_widget.dart';

class UI5Instantiation extends StatelessWidget {
  const UI5Instantiation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI5 Instantiation'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
        foregroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                title + '\n',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              Text(subTitle + '\n'),
              Row(
                children: [
                  Text('- ' + pointText1),
                  TextButton(
                    onPressed: () async {
                      final url = link;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not open $url';
                      }
                    },
                    child: Text(linkText1),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('- ' + pointText2),
                  TextButton(
                    onPressed: () async {
                      final url = link1;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not open $url';
                      }
                    },
                    child: Text(linkText1),
                  ),
                ],
              ),
              Image(
                image: AssetImage(
                    'assets/images/ui5_instantiation/whathappensonappinit.png'),
              ),
              Text(
                '\n - Note: ' + pointText + '\n\n',
                overflow: TextOverflow.fade,
              ),
              Text(
                title2 + '\n',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(subtitle2 + '\n'),
              Text(script1 + '\n'),
              Text(script2Text),
              Text(script2),
              Text(text),
              Text(link2Text),
            ],
          ),
        ),
      ),
    );
  }
}
