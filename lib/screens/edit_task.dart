import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/shared/firebase/firebase_func.dart';
import 'package:todo/shared/styles/colors.dart';

class EditTask extends StatefulWidget {
  static const String routeName = "/editTask";
  TaskModel? taskModel;
  EditTask({this.taskModel});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController task = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  @override
  void initState() {
    task.text = widget.taskModel!.title!;
    selectedDate = DateTime.fromMillisecondsSinceEpoch(widget.taskModel!.date!);

    // Extract hour and minute values from the time string using a regular expression
    final timeRegExp = RegExp(r'(\d+):(\d+)');
    final match = timeRegExp.firstMatch(widget.taskModel!.time!);
    final hour = int.parse(match!.group(1)!);
    final minute = int.parse(match.group(2)!);
    time = TimeOfDay(hour: hour, minute: minute);

    super.initState();
  }

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
                            style: TextStyle(color: primaryColor),
                            controller: task,
                            decoration: InputDecoration(
                                hintText: "10".tr,
                                suffixIcon: Icon(Icons.edit_note_outlined,
                                    color: primaryColor)),
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
                                selectedDate = DateUtils.dateOnly(choosenDate);
                                setState(() {});
                              }
                            },
                            child: Text(
                              "${selectedDate}".toString().substring(0, 10),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: selectedTime, fontSize: 18.sp),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "19".tr,
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
                            height: 25.h,
                          ),
                          InkWell(
                            onTap: () async {
                              TimeOfDay? newTime = await showTimePicker(
                                  context: context, initialTime: time);
                              if (selectedTime == null)
                                return;
                              else {
                                setState(() {
                                  time = newTime!;
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
                            height: 100.h,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: primaryColor,
                            onPressed: () {
                              TaskModel taskModel = TaskModel(
                                  time: time.toString(),
                                  title: task.text,
                                  date: DateUtils.dateOnly(selectedDate)
                                      .millisecondsSinceEpoch,
                                  id: widget.taskModel!.id,
                                  isDone: widget.taskModel!.isDone);
                              FirebaseFunctions.updateTask(taskModel);
                              Navigator.pop(context);
                            },
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
