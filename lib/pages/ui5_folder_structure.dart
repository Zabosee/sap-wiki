import 'package:flutter/material.dart';
import 'package:sap_wiki/content/ui5_folder_structure_content.dart';
import 'package:url_launcher/url_launcher.dart';

class UI5Folder extends StatelessWidget {
  const UI5Folder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI5 Folder Structure'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
        foregroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('- ' + preText),
                      TextButton(
                        onPressed: () async {
                          final url = link;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not open $url';
                          }
                        },
                        child: Text(linkText),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(text1),
                      TextButton(
                        onPressed: () async {
                          final url = link2;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not open $url';
                          }
                        },
                        child: Text(linkText2 + '.'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(text2),
                          TextButton(
                            onPressed: () async {
                              final url = link3;
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not open $url';
                              }
                            },
                            child: Text(linkText3),
                          ),
                          Text(textBetween),
                          TextButton(
                            onPressed: () async {
                              final url = link4;
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not open $url';
                              }
                            },
                            child: Text(linkText4),
                          ),
                        ],
                      ),
                      Column(children: [
                        Text(textAfter + '\n'),
                      ])
                    ],
                  ),
                  Text(
                    title + '\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(tree1 + '\n'),
                  Text(
                    title2 + '\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(tree2 + '\n'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
