
import 'package:flutter/material.dart';

class Settingz extends StatefulWidget {

  static const  String id='settings';


  @override
  State<Settingz> createState() => _SettingzState();
}

class _SettingzState extends State<Settingz> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('Settings'),
        ],
      ),
    );
  }
}
