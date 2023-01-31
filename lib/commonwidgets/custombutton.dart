
import 'package:flutter/material.dart';

import '../config/colors.dart';


class CustomButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const CustomButton({ required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
        onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:AppColor.light,
        minimumSize: const Size(double.infinity, 50),
      ),
        child:Text(text,style: const TextStyle(color: Colors.white,fontSize: 14),),
    );
  }
}
