import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cab_user/styles/bottom_sheet_style.dart';
import 'package:cab_user/views/home/home.dart';

class PaymentBottomScreen extends StatelessWidget {
  const PaymentBottomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("For Payment Select An Option", style: paymentTitle),
        ListTile(
          title: Text("Paypal", style: paymentType),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          ),
        ),
        ListTile(
          title: Text("UPI", style: paymentType),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          ),
        ),
        ListTile(
          onTap: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false),
          title: Text("Cash", style: paymentType),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
