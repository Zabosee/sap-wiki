import 'dart:io';

import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updates'),
        centerTitle: true,
      ),
    );
  }
}