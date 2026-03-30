import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';
import 'app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932), // standard iPhone 11 Pro/X design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Traditional Booking",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          initialRoute: AppRoutes.splash,
          getPages: AppRoutes.routes,
          defaultTransition: Transition.cupertino,
        );
      },
    );
  }
}
