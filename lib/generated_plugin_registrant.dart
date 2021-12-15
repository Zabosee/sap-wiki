
// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher_web/url_launcher_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
