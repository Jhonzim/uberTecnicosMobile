import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_share/bottom_nav_bar.dart';
import 'cadastro.dart';

class Login extends StatefulWidget {
  final bool? comesFromSignUp;
  const Login({Key? key, this.comesFromSignUp}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController cpfCtrl = TextEditingController();
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
              Wrap(
                children: [
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: TextField(
                      controller: cpfCtrl,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        label: Text('CPF'),
                        hintText: '123.456.789-00',
                      ),
                      keyboardType: TextInputType.number,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    ),
                  ),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: TextField(
                      controller: emailCtrl,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        label: Text('E-mail'),
                        hintText: 'exemplo@exemplo.com',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    ),
                  ),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: TextField(
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
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        //TODO: Implementar login
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const BottomNavBar(
                                  snackBar: SnackBar(content: Text('Login realizado com sucesso.')),
                                )),
                            (Route route) => false);
                      },
                      child: const Text('ENTRAR'),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              const Center(
                child: Text(//TODO: Decidir.
                    'Email ou CPF? Email é mais intuitivo mas possibilita a criação de muitas contas. O CPF é mais seguro mas possibilita apenas uma conta por pessoa.'),
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
