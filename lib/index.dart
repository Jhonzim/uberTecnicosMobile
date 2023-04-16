import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool firstTimeState = true; //usar shared preferences para saber se é ou não a primeira vez no app

  @override
  Widget build(BuildContext context) {
    return firstTimeState
        ? const OnboardingScreen()
        : const Scaffold(
            body: Center(child: Text('data')),
          );
  }
}
