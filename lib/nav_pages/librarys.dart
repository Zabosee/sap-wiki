import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Librarys'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
        foregroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('The following Librarys were used for this App\n'),
              Divider(
                thickness: 3,
                height: 10,
              ),
              TextButton(
                onPressed: () async {
                  final url = "https://pub.dev/packages/flutter_markdown";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not open $url';
                  }
                },
                child: Text('Flutter Markdown'),
              ),
              Divider(
                thickness: 3,
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
