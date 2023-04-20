import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tech_share/no_login/landing_page.dart';

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
              SizedBox(
                //*Pagina 1
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
                        Image.asset('images/iconeroubado.png',
                            height: MediaQuery.of(context).size.height * 0.30),
                        Column(
                          children: const [
                            Text('Seja bem-vindo ao Tech Share!',
                                style: TextStyle(fontSize: 18)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Text(
                                'Nosso objetivo é tanto ofertar oportunidades quanto tornar a sua vida mais fácil.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
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
              ), //*Pagina 2
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.93,
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
                          boxHeight: MediaQuery.of(context).size.height * 0.25,
                          boxWidth: MediaQuery.of(context).size.height * 0.30,
                        ),
                        Image.asset(
                          'images/DeuRuim.png',
                          height: MediaQuery.of(context).size.height * 0.40,
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
                            textoAnimado('Programadores'),
                            textoAnimado('Manutentores'),
                            textoAnimado('Empreendedores'),
                            textoAnimado('Técnicos de informática!'),
                          ],
                          isRepeatingAnimation: true,
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        )
                      ],
                    )
                  ],
                ),
              ), //*Pagina 3
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.93,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('images/avaliacoes.png',
                        width: MediaQuery.of(context).size.width * 0.60),
                    Column(
                      children: const [
                        Text(
                          'Seu dispositivo está em boas mãos',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        FractionallySizedBox(
                          widthFactor: 0.9,
                          child: Text(
                            'Seu dispositivo merece os melhores cuidados, e na Tech Share você pode confiar! Os técnicos são avaliados após cada serviço prestado, garantindo a qualidade do atendimento e proporcionando segurança e tranquilidade para o próximo contratante. Conte conosco para resolver seus problemas de informática de forma confiável e eficiente!',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.93,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text('Tech Share',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                        Text(
                          'Com o Tech Share, compartilhe seus problemas tecnológicos e\nencontre a solução com um técnico especializado!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'E então, está pronto?',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            height: 320,
                            width: 180,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('images/1_1.png'),
                                  const Text(
                                      'Busco contratar profissionais',
                                      textAlign: TextAlign.center,
                                      style: TextStyle()),
                                  ElevatedButton(
                                      onPressed: () =>
                                          //TODO: Atualizar o isFirstTime para false e trocar a página navegada para MyApp após atualizado.
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LandingPage()),
                                                  (Route route) => false),
                                      child: const Text('Sou cliente'))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            height: 320,
                            width: 180,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('images/1_1.png'),
                                  const Text(
                                      'Busco novos clientes e contratos a realizar',
                                      textAlign: TextAlign.center,
                                      style: TextStyle()),
                                  ElevatedButton(
                                      onPressed: () =>
                                          //TODO: Atualizar o isFirstTime para false e trocar a página navegada para MyApp após atualizado.
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LandingPage()),
                                                  (Route route) => false),
                                      child: const Text('Sou profissional'))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
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
                      visible: selectedindex < 3 /* era pageView.length - 1 */,
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
    for (int i = 0; i < 4 /* era pageView.length */; i++) {
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
