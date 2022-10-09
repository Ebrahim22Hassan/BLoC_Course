import 'package:flutter/material.dart';
import 'package:localization_app/app_localizations.dart';
import 'package:localization_app/setting_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Page".tr(context)),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const SettingPage())),
              icon: const Icon(Icons.settings))
        ],
      ),
      drawer: const Drawer(),
      body: Center(
        child: Text(
          "hello".tr(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
