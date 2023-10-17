import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/layout/home_layout.dart';

import 'package:todo/shared/styles/colors.dart';

class EditTask extends StatefulWidget {
  static const String routeName = "/editTask";

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController task = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 412.w,
                  height: 870.h,
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
                Container(
                  width: double.infinity,
                  height: 157.h,
                  decoration: BoxDecoration(color: primaryColor),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.offNamed(HomeLayout.routeName);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Get.isDarkMode ? bgColordark : lightColor,
                          )),
                      Text("1".tr,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
                Positioned(
                  top: 95.h,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      width: 340.w,
                      height: 700.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: Offset(0, 2))
                          ],
                          color: Get.isDarkMode
                              ? bgColordark.withOpacity(0.9)
                              : lightColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "9".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Get.isDarkMode
                                          ? lightColor
                                          : blackColor,
                                      fontSize: 28.sp),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          TextFormField(
                            controller: task,
                            decoration: InputDecoration(hintText: "10".tr),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "11".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Get.isDarkMode
                                            ? lightColor
                                            : blackColor,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                            onTap: () async {
                              DateTime? choosenDate = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(Duration(days: 365 * 8)));
                              if (choosenDate == null) {
                                return;
                              } else {
                                selectedDate = choosenDate;
                                setState(() {});
                              }
                            },
                            child: Text(
                              "${selectedDate}".substring(0, 10),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: selectedTime, fontSize: 18.sp),
                            ),
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: primaryColor,
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                "12".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: lightColor,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
