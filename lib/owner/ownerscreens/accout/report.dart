

import 'package:flutter/material.dart';


class Report extends StatefulWidget {

  static const  String id='report';

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('Report'),
        ],
      ),
    );
  }
}
