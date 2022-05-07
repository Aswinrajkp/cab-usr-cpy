import 'package:cab_user/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentController controller = Get.put(PaymentController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Payment",
              style:
                  GoogleFonts.lato(fontSize: 26, fontWeight: FontWeight.w600)),
          centerTitle: true,
          elevation: 0),
      body: GetBuilder<PaymentController>(
        initState: (state){
          controller.razorpay = Razorpay();
    controller.razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, controller.handlePaymentSuccess);
    controller.razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, controller.handlePaymentError);
    controller.razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, controller.handleExternalWallet);
        },
        builder: (controller) {
          return Column(children: [
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              "Payment Methords",
              style: GoogleFonts.oswald(fontSize: 24, fontWeight: FontWeight.w600),
            )),
            SizedBox(
              height: 20,
            ),
          ListTile(
            onTap: () => controller.razorPayPaying(),
            leading: Image.network("https://avatars.githubusercontent.com/u/7713209?s=280&v=4"),
            title: Text("Razorpay",style: GoogleFonts.rubik(fontSize: 23, fontWeight: FontWeight.w600),),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded)),
          ),
          SizedBox(height: 10,),
           ListTile(
            leading: Image.network("https://i0.wp.com/zeevector.com/wp-content/uploads/PayPal-Symbol.png?resize=600%2C600&ssl=1"),
            title: Text("Paypal",style: GoogleFonts.rubik(fontSize: 23, fontWeight: FontWeight.w600),),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded)),
          ),
          SizedBox(height: 10,),
           ListTile(
            leading: Image.network("https://www.pngitem.com/pimgs/m/111-1111293_cash-in-hand-icon-hd-png-download.png"),
            title: Text("Cash",style: GoogleFonts.rubik(fontSize: 23, fontWeight: FontWeight.w600),),
            trailing: IconButton(onPressed: (){
              
            }, icon: Icon(Icons.arrow_forward_ios_rounded)),
          )
          ]);
        }
      ),
    );
  }
}
