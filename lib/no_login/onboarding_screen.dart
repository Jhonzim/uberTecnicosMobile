import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_share/no_login/cadastro.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController(initialPage: 0);
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            children: [
              SizedBox(//*Pagina 1
                height: MediaQuery.of(context).size.height * 0.93,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.translate(
                          offset: const Offset(-150, 0),
                          child: const Text('O real easter egg')),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('images/iconeroubado.png', width: MediaQuery.of(context).size.width/2), //TODO: Inserir logo ou logo com nome da tech share
                        Column(
                          children: [
                            const Text('Seja bem-vindo ao Tech Share!',
                              style: TextStyle(fontSize: 18)),
                            Padding(
                              padding:const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              child: Text(
                                'Nosso objetivo é tanto ofertar oportunidades quanto tornar a sua vida mais fácil.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.93,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        TextLiquidFill(
                          waveDuration: const Duration(seconds: 8),
                          text: 'Deu ruim?',
                          waveColor: Colors.blueAccent,
                          boxBackgroundColor: const Color.fromARGB(0, 0, 0, 0),
                          textStyle: const TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                          ),
                          boxHeight: 200,
                          boxWidth: 220,
                        ),
                        Image.asset(
                          'images/DeuRuim.png',
                          width: 300,
                          height: 300,
                        ), //fonte Akshar no google fonts
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Não se preocupe. No Tech Share, você encontra',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            textoAnimado('Manutentores'),
                            textoAnimado('Programadores'), //adicionar outros depois
                            textoAnimado('Técnicos de informática!'),
                          ],
                          totalRepeatCount: 5,
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.93,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('images/1_2.png'),
                    const Text(
                      'Pronto para usar o Tech Share?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 8, horizontal: 32)),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)))),
                        onPressed: () {
                          //TODO: Atualizar o isFirstTime para false.
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const  Cadastro()), (Route route) => false);
                        },
                        child: const Text('CADASTRAR-SE'))
                  ],
                ),
              ),
            ],
            onPageChanged: (int page) => setState(() {
              selectedindex = page;
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                      visible: selectedindex > 0,
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true,
                      child: TextButton(
                          onPressed: () => controller.animateToPage(
                              selectedindex - 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn),
                          child: const Text('VOLTAR'))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  Visibility(
                      visible: selectedindex < 2,
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true,
                      child: TextButton(
                          onPressed: () => controller.animateToPage(
                              selectedindex + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn),
                          child: const Text('PRÓXIMO'))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 3 /*era pageView.length*/; i++) {
      list.add(i == selectedindex
          ? _indicator(true, i, controller, context)
          : _indicator(false, i, controller, context));
    }
    return list;
  }
}

Widget _indicator(bool isActive, int pos, PageController c, context) {
  return GestureDetector(
    onTap: () {
      c.animateToPage(pos,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn);
    },
    child: SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: const Color.fromARGB(255, 24, 151, 21)
                        .withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  )
                : const BoxShadow(
                    color: Colors.transparent,
                  )
          ],
          shape: BoxShape.circle,
          color: isActive
              ? const Color.fromARGB(255, 24, 151, 21)
              : const Color(0XFFEAEAEA),
        ),
      ),
    ),
  );
}

textoAnimado(String texto) {
  return TypewriterAnimatedText(
    texto,
    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    speed: const Duration(milliseconds: 200),
  );
}
