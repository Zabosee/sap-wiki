import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;

class Module extends StatelessWidget {
  const Module({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dsa'),
      ),
      body: TextButton(onPressed: getMarkdown, child: Text('dsa')),
    );
  }

  Future<Markdown> getMarkdown() async {
    var url = Uri.parse(
        "https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/Module%20Loading%20in%20UI5.md");
    http.Response res = await http.get(url);
    try {
      if (res.statusCode == 200) {
        String data = res.body;
        return Markdown(data: data);
      } else {
        throw '';
      }
    } catch (e) {
      throw '$e';
    }
  }
}
