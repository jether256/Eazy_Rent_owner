
import 'package:flutter/material.dart';

class EditBizAccount extends StatefulWidget {

  static const  String id='edit biz';

  @override
  State<EditBizAccount> createState() => _EditBizAccountState();
}

class _EditBizAccountState extends State<EditBizAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text('Edit Business'),
          ],
        ),
      ),
    );
  }
}
