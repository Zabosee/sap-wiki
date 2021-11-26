// ignore: file_names
import 'package:flutter/material.dart';
import 'package:sap_wiki/home_content.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marco Beier'),
        backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
        foregroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/MB_PB.jpg'),
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
                  onPressed: () {},
                  icon: Image.asset('assets/images/LinkedIn.jpg'),
                  iconSize: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/Xing.jpg'),
                  iconSize: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/GitHub.jpg'),
                  iconSize: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/Twitter.jpg'),
                  iconSize: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/SAP.jpg'),
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
                Text(content2),
              ],
            ),
          ),
        ],
      ),
    );
  } 
}

