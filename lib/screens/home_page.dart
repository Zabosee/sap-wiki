import 'package:flutter/material.dart';
import 'package:sap_wiki/screens/home_content.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('\nThe content of the SAPUI5 Wiki is provided by this guy\n'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircleAvatar(
                  backgroundImage:
                      ExactAssetImage('assets/images/homepage/MB_PB.jpg'),
                  maxRadius: 70,
                  minRadius: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      final url = linkedin;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not open $url';
                      }
                    },
                    icon: Image.asset('assets/images/homepage/LinkedIn.jpg'),
                    iconSize: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      final url = xing;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not open $url';
                      }
                    },
                    icon: Image.asset('assets/images/homepage/Xing.jpg'),
                    iconSize: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      final url = git;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not open $url';
                      }
                    },
                    icon: Image.asset('assets/images/homepage/GitHub.jpg'),
                    iconSize: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      final url = twitter;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not open $url';
                      }
                    },
                    icon: Image.asset('assets/images/homepage/Twitter.jpg'),
                    iconSize: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      final url = sap;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not open $url';
                      }
                    },
                    icon: Image.asset('assets/images/homepage/SAP.jpg'),
                    iconSize: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(subtitle + '\n'),
                  Text(content + '\n'),
                  Text(content2 + '\n\n\n'),
                ],
              ),
            ),
            Text(
              'What am I working with?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text('- Rough outline -' '\n\n'),
            SizedBox(
              width: 250,
              height: 400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/images/homepage/Toolbox.jpg'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 250,
              height: 340,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/images/homepage/Sapbox.jpg'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 250,
              height: 340,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image:
                          AssetImage('assets/images/homepage/languagesbox.jpg'),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     children: [
            //       Text('Wiki/Blog' + '\n',
            //           style:
            //               TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            //     ],
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => WikiPedia(),
            //       ),
            //     );
            //   },
            //   child: Text('Zu meinem SAP Wiki'),
            // ),
          ],
        ),
      ),
    );
  }
}
