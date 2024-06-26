import 'package:ecommerce_app/router/router_page.dart';
import 'package:ecommerce_app/screen/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'E-commerce App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
            textTheme: Typography.englishLike2021.apply(fontSizeFactor: 1.sp),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          routerConfig: AppRouter.appRouter,
        );
      },
    );
  }
}
