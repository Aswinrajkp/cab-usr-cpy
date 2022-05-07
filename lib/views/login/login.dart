import 'package:cab_user/controller/register&login_controller.dart';
import 'package:cab_user/requests/google_auth.dart';
import 'package:cab_user/requests/login_post_request.dart';
import 'package:cab_user/views/register/validation_funtions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cab_user/styles/login_register_otp_style.dart';
import 'package:cab_user/views/home/home.dart';
import 'package:cab_user/views/otp_verification/number_entering.dart';
import 'package:cab_user/views/register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final globalformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginRegisterController controller = Get.put(LoginRegisterController());
    GoogleSignInController googleSignInController = GoogleSignInController();
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context,snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
                }else if(snapshot.hasError){
                  return Center(child: Text("something went Wrong"),);
                }else if(snapshot.hasData){
                  return HomeScreen();
                }
                else{
                return Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 50, top: 130),
                      child: Text("Welcome \nback", style: welcomeFont),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.45,
                            right: 35,
                            left: 35),
                        child: Form(
                          key: globalformKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (validateEmail(value) == false) {
                                    return "Enter Valid Email";
                                  }
                                },
                                // onEditingComplete: () => LoginData(email: emailController.text, password: passwordController.text),
                                controller: emailController,
                                decoration: InputDecoration(
                                    // label: Text("Email", style: labelFont),
                                    hintText: "Enter Your Email",
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    border: textfieldBorder),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null) {
                                    return "Enter Password";
                                  }
                                },
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    // label: Text("Password", style: labelFont),
                                    hintText: "Enter Your Password",
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    border: textfieldBorder),
                              ),
                              SizedBox(
                                height: 27,
                              ),
                              GetBuilder<LoginRegisterController>(
                                  builder: (controller) {
                                return Text(
                                  controller.alreadyLogin ? "No user found" : "",
                                  style: TextStyle(color: Colors.red, fontSize: 14),
                                );
                              }),
                              InkWell(
                                onTap: () async {
                                  if (globalformKey.currentState!.validate()) {
                                    var email = emailController.text;
                                    var password = passwordController.text;
                                    int? loginstate = await loginPost(
                                        email: email, password: password);
                                    print(loginstate);
                                    if (loginstate == 200) {
                                      controller.falseState();
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                    } else {
                                      controller.loginSetting();
                                    }
                                  }
                                },
                                child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 26, 24, 24),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                        child: Text("SIGN IN", style: signInText))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("------or-------"),
                              ),
                              GestureDetector(
                                onTap: (){
                                  googleSignInController.googleLogin();
                                },
                                // onTap: ()=> vehicleDetails(),
                                // onTap: (() => Get.to(NumberEnteringScreen()) ),
                                child: Image(
                                    height: 50,
                                    image:
                                        AssetImage("assets/images/login singn.png")),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("new User? ", style: newUserText),
                                  TextButton(
                                      onPressed: () {
                                        Get.off(RegisterScreen(),
                                            transition: Transition.rightToLeft);
                                      },
                                      child: Text("Sign Up", style: blueSignin))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
                }
              }
            ),
          ),
        );
  }
}
