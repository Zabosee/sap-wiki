import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sap_wiki/provider/google_sign_in.dart';
import 'package:sap_wiki/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider(
        //   create: (context) => GoogleSignInProvider(),
        //   child:
        MaterialApp(
      title: 'MaterialApp',
      darkTheme: ThemeData.dark(),
      home: StartScreen(),
      // ),
    );
  }
}
