import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int batchIconNumber = 0;

  String currentIconName = "?";

  bool loading = false;
  bool showAlert = true;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    FlutterDynamicIcon.getApplicationIconBadgeNumber().then((v) {
      setState(() {
        batchIconNumber = v;
      });
    });

    FlutterDynamicIcon.getAlternateIconName().then((v) {
      setState(() {
        currentIconName = v ?? "`primary`";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Current Icon Name: $currentIconName",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SwitchListTile(
                title: Text("Show Alert"),
                subtitle: Text(
                    "Disable alert at your own risk as it uses a private/undocumented API"),
                value: showAlert,
                onChanged: (value) {
                  setState(() {
                    showAlert = value;
                  });
                }),
            OutlinedButton.icon(
              icon: Icon(Icons.ac_unit),
              label: Text("Team Fortress"),
              onPressed: () async {
                try {
                  print(await FlutterDynamicIcon.supportsAlternateIcons);
                  if (await FlutterDynamicIcon.supportsAlternateIcons) {
                    await FlutterDynamicIcon.setAlternateIconName(
                        "teamfortress",
                        showAlert: showAlert);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("App icon change successful"),
                    ));
                    FlutterDynamicIcon.getAlternateIconName().then((v) {
                      setState(() {
                        currentIconName = v ?? "`primary`";
                      });
                    });
                    return;
                  }
                } on PlatformException {
                } catch (e) {}
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Failed to change app icon"),
                ));
              },
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.ac_unit),
              label: Text("Photos"),
              onPressed: () async {
                try {
                  if (await FlutterDynamicIcon.supportsAlternateIcons) {
                    await FlutterDynamicIcon.setAlternateIconName("photos",
                        showAlert: showAlert);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("App icon change successful"),
                    ));
                    FlutterDynamicIcon.getAlternateIconName().then((v) {
                      setState(() {
                        currentIconName = v ?? "`primary`";
                      });
                    });
                    return;
                  }
                } on PlatformException {
                } catch (e) {}
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Failed to change app icon"),
                ));
              },
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.ac_unit),
              label: Text("Chills"),
              onPressed: () async {
                try {
                  if (await FlutterDynamicIcon.supportsAlternateIcons) {
                    await FlutterDynamicIcon.setAlternateIconName("chills",
                        showAlert: showAlert);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("App icon change successful"),
                    ));
                    FlutterDynamicIcon.getAlternateIconName().then((v) {
                      setState(() {
                        currentIconName = v ?? "`primary`";
                      });
                    });
                    return;
                  }
                } on PlatformException {
                } catch (e) {}
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Failed to change app icon"),
                ));
              },
            ),
            SizedBox(
              height: 28,
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.restore_outlined),
              label: Text("Restore Icon"),
              onPressed: () async {
                try {
                  if (await FlutterDynamicIcon.supportsAlternateIcons) {
                    await FlutterDynamicIcon.setAlternateIconName(null,
                        showAlert: showAlert);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("App icon restore successful"),
                    ));
                    FlutterDynamicIcon.getAlternateIconName().then((v) {
                      setState(() {
                        currentIconName = v ?? "`primary`";
                      });
                    });
                    return;
                  }
                } on PlatformException {
                } catch (e) {}
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Failed to change app icon"),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
