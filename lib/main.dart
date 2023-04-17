import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:tech_share/bottom_nav_bar.dart';
import 'package:tech_share/no_login/landing_page.dart';
import 'package:tech_share/no_login/onboarding_screen.dart';

Future<void> main() async {
  //await Firebase.initializeApp
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: ScrollBehavior(),
        title: 'Tech Share',
        theme: ThemeData(
          snackBarTheme:
              const SnackBarThemeData(behavior: SnackBarBehavior.floating),
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 2),
              scrolledUnderElevation: 9,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20)))),
        ),
        home: const CheckIn());
  }
}

class CheckIn extends StatefulWidget{
  const CheckIn({super.key});

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  void initState() {
    super.initState();
    //TODO: Usar conectivity aqui
  }

  bool isFirstTime =
      true; //usar shared preferences para saber se é ou não a primeira vez no app
  bool isLoggedIn = false; //checar se o usuário está logado

  @override
  Widget build(BuildContext context) {
    return isFirstTime
        ? const OnboardingScreen()
        : isLoggedIn
            ? const BottomNavBar()
            : const LandingPage();
  }
}
