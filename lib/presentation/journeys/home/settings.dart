import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white54,
        body: const Center(
          child: Text('Settings', style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_40),),
        ),
      ),
    );
  }

}