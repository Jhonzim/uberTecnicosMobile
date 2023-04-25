import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_share/bottom_nav_bar.dart';
import 'package:tech_share/valores_e_funcoes.dart';
import 'cadastro.dart';

class Login extends StatefulWidget {
  final bool? comesFromSignUp;
  const Login({Key? key, this.comesFromSignUp}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController senhaCtrl = TextEditingController();

  bool isPasswordInvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('LOGIN'),
          floating: true,
        ),
        SliverFillRemaining(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Wrap(
                  children: [
                    const SizedBox(height: 5),
                    TextField(
                      controller: emailCtrl,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        label: Text('E-mail'),
                        hintText: 'exemplo@exemplo.com',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: senhaCtrl,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.key),
                          label: const Text('Senha'),
                          suffixIcon: IconButton(
                              icon: isPasswordInvisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off_outlined),
                              onPressed: () => setState(() {
                                    isPasswordInvisible = !isPasswordInvisible;
                                  }))),
                      obscureText: isPasswordInvisible,
                      enableSuggestions: false,
                      autocorrect: false,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          //TODO: Implementar login
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => const BottomNavBar()),
                              (Route route) => false);
                              showSnackBar('Login realizado com sucesso.', context);
                        },
                        child: const Text('ENTRAR'),
                      ),
                    ),
                  ],
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  children: [
                    const Text('Ou também'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColorLight),
                        elevation: const MaterialStatePropertyAll(10),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))
                      ),
                      onPressed: () {
                        //TODO: Implementar login com google
                        showSnackBar('Login com google realizado com sucesso.', context);
                      },
                      child: ListTile(
                        leading: Image.network('https://www.transparentpng.com/thumb/google-logo/shady-google-logo-pictures-png-free-BjH4wQ.png',
                          height: 40),
                        title: const Center(child: Text('ENTRAR COM GOOGLE')),
                        trailing: const SizedBox(),
                      )
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      //TODO: Implementar recuperação de senha.
                    },
                    child: const Text('Esqueci minha senha'),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: GestureDetector(
                        onTap: () => widget.comesFromSignUp != null
                            ? Navigator.pop(context)
                            : Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Cadastro(comesFromLogin: true)),
                              ),
                        child: RichText(
                            text: const TextSpan(
                                text: 'Não tem uma conta? ',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  text: 'Realizar cadastro',
                                  style: TextStyle(color: Colors.blueAccent))
                            ])),
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
