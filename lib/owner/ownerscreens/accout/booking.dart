
import 'package:flutter/material.dart';

class Bookings extends StatefulWidget {

  static const  String id='booking';

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('Booking'),
        ],
      ),
    );
  }
}
