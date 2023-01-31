
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {

  static const  String id='notification';
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('Notification'),
        ],
      ),
    );
  }
}
