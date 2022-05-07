import 'package:cab_user/views/widgets/payment_sucess.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController{
 late Razorpay razorpay;


 void razorPayPaying() async {
    var options = {
      'key': 'rzp_test_eY0A26ThdUXkrC',
      'amount': (double.parse("100")*100.roundToDouble()).toString(),
      'name': '',
      'description': '',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
  Get.off(SuccessScreen());
  }

  void handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    /*Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
     /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }
}