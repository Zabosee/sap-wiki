import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:sap_wiki/screens/wiki.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher/url_launcher.dart';

import 'navigation_drawer_widget.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("SAP Ui5"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
        foregroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Welcome to the SAP Ui5 Wiki\n'),
                Text('It is here to help you out in a few cases\n'),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text('The App is create by'),
                //     TextButton(
                //       onPressed: () async {
                //         final url = "https://github.com/Zabosee";
                //         if (await canLaunch(url)) {
                //           await launch(url);
                //         } else {
                //           throw 'Could not open $url';
                //         }
                //       },
                //       child: Text(
                //         'Zabosee',
                //         style: TextStyle(color: Colors.deepOrange[900]),
                //       ),
                //     ),
                //   ],
                // ),
                Text('It can take 1-2 seconds to completly load the wiki\n'),
                Text(
                    'For more information about the wiki go to Content on the side menu\n'),
                Text(
                    'The App is still in progress, so some links may not work.\n'),
                Padding(
                  padding: const EdgeInsets.only(top: 290),
                  child: GlowButton(
                    width: 250,
                    height: 70,
                    child: Text(
                      'Open the SAPUI5-Wiki',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WikiPedia()));
                    },
                    color: Colors.blue[700],
                    glowColor: Color.fromRGBO(131, 238, 255, 1),
                    splashColor: Color.fromRGBO(131, 238, 255, 1),
                    blurRadius: 25,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
