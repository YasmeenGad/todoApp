import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/localization/locale.dart';
import 'package:todo/screens/edit_task.dart';
import 'package:todo/shared/styles/theming.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 870),
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          locale: Locale("en"),
          translations: LocaleLang(),
          theme: MyThemeData.customlightTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: HomeLayout.routeName,
          getPages: [
            GetPage(name: HomeLayout.routeName, page: () => HomeLayout()),
            GetPage(name: EditTask.routeName, page: () => EditTask()),
          ],
        );
      },
    );
  }
}
