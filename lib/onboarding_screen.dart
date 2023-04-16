import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController(initialPage: 1);
  int selectedindex = 1;
  final List<Widget> pageView = [
    easterEgg,
    pagina1,
    pagina2,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            itemCount: pageView.length,
            itemBuilder: (context, index) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.93,
                child: pageView[index]),
            onPageChanged: (int page) => setState(() {
              selectedindex = page;
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < pageView.length; i++) {
      list.add(i == selectedindex
          ? _indicator(true, i, controller, context)
          : _indicator(false, i, controller, context));
    }
    return list;
  }
}

Widget easterEgg = Stack(
  children: [
    Align(
      alignment: Alignment.centerLeft,
      child: Transform.translate(
          offset: const Offset(-150, 0),
          child: const Text('O real easter egg')),
    ),
    const Center(
      child: Text('Insira um easter egg legal aqui'),
    ),
  ],
);

Widget pagina1 = Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Image.asset('images/1_1.png'),
    Column(
      children: [
        const Text('Aqui você encontra'),
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
    ),
  ],
);

Widget pagina2 = Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Stack(
      alignment: Alignment.center,
      children: [
        TextLiquidFill(
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
          'images/Background (1).png',
          width: 300,
          height: 300,
        ), //fonte Akshar no google fonts
      ],
    ),
    const Text('Não se preocupe. No Tech Share, você encontra.....')
  ],
);

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
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    speed: const Duration(milliseconds: 200),
  );
}
