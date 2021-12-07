import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:sap_wiki/home_page.dart';
import 'package:sap_wiki/wiki.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI5 Wiki"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
        foregroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/strand.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GlowButton(
                  child: Text(
                    'Marco',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  color: Colors.blue[600],
                  glowColor: Color.fromRGBO(0, 0, 139, 1),
                  splashColor: Color.fromRGBO(0, 0, 139, 1),
                  blurRadius: 25,
                  borderRadius: BorderRadius.circular(50),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: GlowButton(
                    child: Text(
                      'Wiki',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WikiPedia()));
                    },
                    color: Colors.blue[700],
                    glowColor: Color.fromRGBO(0, 0, 139, 1),
                    splashColor: Color.fromRGBO(0, 0, 139, 1),
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
