

import 'package:flutter/material.dart';

import '../config/colors.dart';

class AppBarMan extends StatefulWidget {
  const AppBarMan({Key? key}) : super(key: key);

  @override
  State<AppBarMan> createState() => _AppBarManState();
}

class _AppBarManState extends State<AppBarMan> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(icon:const Icon(Icons.apps), onPressed: () {  },),
      actions: [
        IconButton(icon:const Icon(Icons.apps), onPressed: () {  },),
        IconButton(icon:const Icon(Icons.apps), onPressed: () {  },),
        IconButton(icon:const Icon(Icons.apps), onPressed: () {  },),
        IconButton(icon:const Icon(Icons.apps), onPressed: () {  },),
      ],
      elevation: 0,
      centerTitle: true,
      backgroundColor:AppColor.primary,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
      ),
      flexibleSpace: Image.asset('assets/images/logo.png',fit: BoxFit.cover,),
    );
  }
}
