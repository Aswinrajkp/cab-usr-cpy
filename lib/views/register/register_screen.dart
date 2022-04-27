import 'package:cab_user/controller/register&login_controller.dart';
import 'package:cab_user/requests/register_post_request.dart';
import 'package:cab_user/views/home/home.dart';
import 'package:cab_user/views/register/validation_funtions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cab_user/styles/login_register_otp_style.dart';
import 'package:cab_user/views/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  String? password = "";

  @override
  Widget build(BuildContext context) {
    LoginRegisterController controller = Get.put(LoginRegisterController());
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/register.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 40, top: 40),
                child: Text("Welcome to \n Our Service", style: welcomeFont),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35,
                      right: 35,
                      left: 35),
                  child: Form(
                    key: formGlobalKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: ((value) {
                            if (value == "") {
                              return "Enter Valid Username";
                            }
                          }),
                          controller: nameController,
                          decoration: InputDecoration(
                              // label: Text("Username", style: labelFont),
                              hintText: "Enter Your Username",
                              fillColor: textfieldColor,
                              filled: true,
                              border: textfieldBorder),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (mobileValidation(value) == false) {
                              return "Enter Valid Number";
                            }
                          },
                          controller: mobileController,
                          decoration: InputDecoration(
                              // label: Text(
                              //   "Mobile",
                              //   style: labelFont,
                              // ),
                              hintText: "Enter Valid Mobile ",
                              fillColor: textfieldColor,
                              filled: true,
                              border: textfieldBorder),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (validateEmail(value) == false) {
                              return "Enter Valid Email";
                            }
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                              // label: Text("Email", style: labelFont),
                              hintText: "Enter Your Email",
                              fillColor: textfieldColor,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.length <= 4) {
                              return "Password Need Minimum 4 Numbers";
                            } else {
                              password = value;
                            }
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              // label: Text(
                              //   "Password",
                              //   style: labelFont,
                              // ),
                              hintText: "Enter Your Password",
                              fillColor: textfieldColor,
                              filled: true,
                              border: textfieldBorder),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value != password) {
                              return "Password Is Not Matching";
                            }
                          },
                          controller: confirmController,
                          obscureText: true,
                          decoration: InputDecoration(
                              // label: Text("Confirm Password", style: labelFont),
                              hintText: "Confirm Your Password",
                              fillColor: textfieldColor,
                              filled: true,
                              border: textfieldBorder),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GetBuilder<LoginRegisterController>(
                            builder: (controller) {
                          return Text(
                            controller.alreadyRegister
                                ? "The email is already registered"
                                : "",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          );
                        }),
                        GestureDetector(
                          onTap: () async {
                            if (formGlobalKey.currentState!.validate()) {
                              var name = nameController.text;
                              var password = passwordController.text;
                              var email = emailController.text;
                              var phone = mobileController.text;
                              int? registerState = await registerPost(
                                  name: name,
                                  password: password,
                                  email: email,
                                  phone: phone);
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString('username', name);
                              if (registerState == 200) {
                                controller.falseState();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => HomeScreen(),
                                  ),
                                );
                              } else {
                                controller.registerSetting();
                              }
                            }
                          },
                          child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 26, 24, 24),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text("SIGN UP", style: signInText))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("New User? ", style: newUserText),
                            TextButton(
                                onPressed: () {
                                  Get.off(LoginScreen(),
                                      transition: Transition.leftToRight);
                                },
                                child: Text("Sign In", style: blueSignin))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
