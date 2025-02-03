import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp.router(
      debugShowCheckedModeBanner: false,
       routerConfig: router,
      //home: SplashScreen(),
      theme: ThemeData(
          fontFamily: "Manrope",
          textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontSize: 11,
          ),
          titleMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500
          ),
          titleLarge: TextStyle(
            fontSize: 22,
          ),
          bodySmall: TextStyle(
            fontSize: 10,
            color: Colors.black54
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            color: Colors.black54,
            fontWeight: FontWeight.w500
          ),
          bodyLarge: TextStyle(
            fontSize: 22,
            color: Colors.black54
          ),
        )
      ),
    );
  }
}