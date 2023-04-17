import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tech_share/no_login/login.dart';
import 'cadastro.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverFillViewport(
              delegate: SliverChildListDelegate(
                [
                  Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      Image.asset('images/menorqualidade.png',
                          fit: BoxFit.cover),
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 8.0,
                          sigmaY: 8.0,
                        ),
                        child: Container(
                          color: Colors.white.withAlpha(20),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                              'images/iconeroubado.png', width: MediaQuery.of(context).size.width/2), //logo da tech share com nome
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.50,
                            child: Column(
                              children: [
                                FractionallySizedBox(
                                  widthFactor: 0.9,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)))),
                                    onPressed: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => const Login())),
                                    child: const Text('ENTRAR'),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: 0.9,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)))),
                                    onPressed: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Cadastro())),
                                    child: const Text('CADASTRAR-SE'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
