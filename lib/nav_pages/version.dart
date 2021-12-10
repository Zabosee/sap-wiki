import 'package:flutter/material.dart';

class VersionPage extends StatelessWidget {
  const VersionPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Version'),
        centerTitle: true,
      ),
    );
  }
}