import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});
  static const String routeName = "/login";
  RxBool isObsecure = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
              height: 50.h,
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
                  cursorColor: Colors.grey.withOpacity(0.3),
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
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
                    cursorColor: Colors.grey.withOpacity(0.3),
                    style: TextStyle(color: Colors.black),
                    obscureText: isObsecure.value,
                    onTap: () => isObsecure.value = !isObsecure.value,
                    decoration: InputDecoration(
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
            Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 22.sp, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: Text(
                "Or Login With",
                style: TextStyle(fontSize: 18.sp, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  width: 60.w,
                  height: 60.h,
                  child: Image.asset(
                    "assets/images/facebook.png",
                  ),
                )),
                Expanded(
                    child: Container(
                  width: 60.w,
                  height: 60.h,
                  child: Image.asset(
                    "assets/images/google.png",
                    width: 60.w,
                    height: 60.h,
                  ),
                )),
                Expanded(
                    child: Container(
                  width: 60.w,
                  child: Image.asset(
                    "assets/images/apple.png",
                    width: 60.w,
                    height: 60.h,
                  ),
                )),
              ],
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
                  onTap: () {},
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 20.sp, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
