import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/localization/locale.dart';
import 'package:todo/screens/auth/login.dart';
import 'package:todo/screens/auth/signUp.dart';
import 'package:todo/shared/styles/theming.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseFirestore.instance.disableNetwork();
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
          theme: Get.isDarkMode
              ? MyThemeData.customdarkTheme
              : MyThemeData.customlightTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: (FirebaseAuth.instance.currentUser != null)
              ? HomeLayout.routeName
              : Login.routeName,
          getPages: [
            GetPage(name: HomeLayout.routeName, page: () => HomeLayout()),
            GetPage(name: Login.routeName, page: () => Login()),
            GetPage(name: SignUp.routeName, page: () => SignUp()),
          ],
        );
      },
    );
  }
}
