import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/shared/firebase/firebase_func.dart';

import 'package:todo/shared/styles/colors.dart';

class AddTaskBtmSheet extends StatefulWidget {
  @override
  State<AddTaskBtmSheet> createState() => _AddTaskBtmSheetState();
}

class _AddTaskBtmSheetState extends State<AddTaskBtmSheet> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(20),
          horizontal: ScreenUtil().setWidth(50.w)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "13".tr,
              // textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Get.isDarkMode ? lightColor : blackColor,
                  fontSize: 30.sp),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Form(
            key: formkey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter title task";
                } else {
                  return null;
                }
              },
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              controller: title,
              decoration: InputDecoration(
                hintText: "14".tr,
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            children: [
              Text(
                "11".tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Get.isDarkMode ? lightColor : blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          InkWell(
            onTap: () async {
              DateTime? choosenDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365 * 8)));
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
                  .copyWith(color: selectedTime),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            children: [
              Text(
                "19".tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Get.isDarkMode ? lightColor : blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          InkWell(
            onTap: () async{
            TimeOfDay? newTime=await  showTimePicker(context: context, initialTime: time);
            if(selectedTime==null) return;
            else {
              setState(() {
                time=newTime!;
              });
            }
            },
            child: Text(
              "${time.hour}:${time.minute}",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: selectedTime),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: primaryColor,
            onPressed: () {
              if (formkey.currentState!.validate()) {
                TaskModel taskModel = TaskModel(
                  time: time.toString(),
                    title: title.text,
                    date: DateUtils.dateOnly(selectedDate)
                        .millisecondsSinceEpoch);
                FirebaseFunctions.addTask(taskModel);
                Navigator.pop(context);
              }
            },
            child: Text(
              "15".tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: lightColor),
            ),
          )
        ],
      ),
    );
  }
}
