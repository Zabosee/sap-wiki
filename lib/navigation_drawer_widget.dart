import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sap_wiki/nav_pages/content.dart';
import 'package:sap_wiki/nav_pages/librarys.dart';
import 'package:sap_wiki/nav_pages/setttings.dart';
import 'package:sap_wiki/nav_pages/update/updates.dart';
import 'package:sap_wiki/nav_pages/version.dart';

import 'nav_pages/contact.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);
  final padding = EdgeInsets.only(left: 20, top: 40, right: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(44, 47, 51, 1),
        child: ListView(
          padding: padding,
          children: <Widget>[
            SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: 'Contact',
              icon: Icons.contact_mail,
              onClicked: () => selectedItem(context, 0),
            ),
            buildMenuItem(
              text: 'Content',
              icon: Icons.article,
              onClicked: () => selectedItem(context, 1),
            ),
            buildMenuItem(
              text: 'Settings',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 2),
            ),
            buildMenuItem(
              text: 'Changelog',
              icon: Icons.update,
              onClicked: () => selectedItem(context, 3),
            ),
            buildMenuItem(
              text: 'Version',
              icon: Icons.info,
              onClicked: () => selectedItem(context, 4),
            ),
            Divider(
              height: 20,
              thickness: 3,
            ),
            buildMenuItem(
              text: 'Librarys',
              icon: Icons.account_tree_outlined,
              onClicked: () => selectedItem(context, 5),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContactPage(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContentPage(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SettingsPage(),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UpdatePage(),
          ),
        );
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VersionPage(),
          ),
        );
        break;
      case 5:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LibraryPage(),
          ),
        );
        break;
    }
  }
}
