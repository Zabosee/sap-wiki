import 'package:flutter/material.dart';

class VersionPage extends StatelessWidget {
  const VersionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Version'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
        foregroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hereinafter can you read more about the app\n'),
            Text('- The whole Project is getting updated frequently\n'),
            Text(
                '- The idea of this app is to help you out at some kind of questions\n'),
            Text('- Current Version: 1.0.1\n'),
          ],
        ),
      ),
    );
  }
}
