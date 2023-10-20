import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/screens/auth/signUp.dart';
import 'package:todo/shared/components/components.dart';
import 'package:todo/shared/network/remote/signIn_fun.dart';
import 'package:todo/shared/network/remote/sign_in_with_google_func.dart';

class Login extends StatefulWidget {
  Login({super.key});
  static const String routeName = "/login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool isLoading = false;

  RxBool isObsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 150.w,
                      height: 150.h,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "Login to continue using app",
                    style: TextStyle(fontSize: 18.sp, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextFormField(
                            validator: (val) {
                              return validateEmail(val!);
                            },
                            controller: email,
                            cursorColor: Colors.grey.withOpacity(0.3),
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "email",
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.3),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(30)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Obx(
                            () => TextFormField(
                              validator: (val) {
                                return validatePassword(val!);
                              },
                              controller: password,
                              cursorColor: Colors.grey.withOpacity(0.3),
                              style: TextStyle(color: Colors.black),
                              obscureText: isObsecure.value,
                              onTap: () => isObsecure.value = !isObsecure.value,
                              decoration: InputDecoration(
                                hintText: "password",
                                suffixIcon: isObsecure.value
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                                filled: true,
                                fillColor: Colors.grey.withOpacity(0.3),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(30)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Forget password?",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        await SignIn(email.text, password.text, context);
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style:
                              TextStyle(fontSize: 22.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLoading = true;
                      });

                      signInWithGoogle();
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login With Google",
                              style: TextStyle(
                                  fontSize: 22.sp, color: Colors.white),
                            ),
                            Image.asset(
                              "assets/images/google.png",
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 18.sp, color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(SignUp.routeName);
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(fontSize: 20.sp, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
            ),
    );
  }
}
