import 'package:go_router/go_router.dart';
import '../../view/auth/sign_up_screen.dart';
import '../../view/auth/splash_screen.dart';
import '../../view/home/home_screen.dart';


final GoRouter router = GoRouter(
  initialLocation: '/SignUpScreen', // Set the initial route
  routes: [
    // Define the main screen route
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const SplashScreen(),
    // ),
    GoRoute(
      path: '/SignUpScreen',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: "/HomeScreen",
      builder: (context, state) => const HomeScreen(),
    ),

  ],
  errorBuilder: (context, state) => const SignUpScreen(),

);