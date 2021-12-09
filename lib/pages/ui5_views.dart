import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class UI5Views extends StatelessWidget {
  const UI5Views({Key? key}) : super(key: key);

  final String urlG =
      "https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/Module%20Loading%20in%20UI5.md";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dsa'),
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1),
            () => rootBundle.loadString("lib/content/ui5_views_content.md")),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Markdown(
              data: snapshot.data!,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}