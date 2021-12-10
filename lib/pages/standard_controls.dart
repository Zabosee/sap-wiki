import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class StandardControls extends StatelessWidget {
  const StandardControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Extend Standard Controls'),
        backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
        foregroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1),
            () => rootBundle.loadString("lib/content/standard_controls.md")),
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
