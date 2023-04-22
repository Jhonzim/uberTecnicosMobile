import 'dart:io';
import 'package:all_validations_br/all_validations_br.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_share/no_login/login.dart';
import 'package:tech_share/valores_e_funcoes.dart';

class Cadastro extends StatefulWidget {
  final bool? comesFromLogin;
  final bool? isTecnico;
  const Cadastro({Key? key, this.comesFromLogin, this.isTecnico})
      : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cpfCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController senhaCtrl = TextEditingController();
  TextEditingController numCtrl = TextEditingController();
  TextEditingController bioCtrl = TextEditingController();
  TextEditingController qtdCertificados =
      TextEditingController(text: 'Selecione um ou mais certificados');

  bool isPasswordInvisible = true;
  late bool isTecnico;

  FilePickerResult? result;
  PlatformFile? pickedFile;
  File? fileToDisplay;
  List<File> selectedFilesPaths = [];

  @override
  void initState() {
    isTecnico = widget.isTecnico ?? false;
    super.initState();
  }

  void pickFile() async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: true,
      );
      if (result != null) {
        selectedFilesPaths = result!.paths.map((path) => File(path!)).toList();
        // ignore: unused_local_variable
        List<File> files = result!.files.map((path) => File('1')).toList();

        setState(() {
          qtdCertificados.text =
              '${selectedFilesPaths.length.toString()} arquivos selecionados.';
        });

        //_fileName = result!.files.first.name;
        //pickedFile = result!.files.first;
        //fileToDisplay = File(pickedFile!.path.toString());
        //debugPrint('Nome dos arquivos: $_fileName');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Criar conta como Técnico'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Ao clicar neste botão, você criará uma conta como um técnico de informática, podendo apenas aceitar contratos e não criá-los.',
                    textAlign: TextAlign.justify),
                Text('Você concorda com esta mensagem?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('NÃO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('SIM'),
              onPressed: () {
                Navigator.of(context).pop();
                showSnackBar('Cadastrou-se como técnico', context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('CADASTRO'),
          floating: true,
          actions: [
            IconButton(
                onPressed: () => setState(() {
                      showSnackBar(
                          isTecnico
                              ? 'Trocou para cadastro de usuário comum'
                              : 'Trocou para cadastro de usuário técnico',
                          context);
                      isTecnico = !isTecnico;
                    }),
                icon: isTecnico
                    ? const Tooltip(
                        message: 'Trocar para cadastro comum',
                        child: Icon(Icons.handyman_rounded))
                    : const Tooltip(
                        message: 'Trocar para cadastro técnico',
                        child: Icon(Icons.person)))
          ],
        ),
        SliverFillRemaining(
          child: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: TextFormField(
                        controller: cpfCtrl,
                        inputFormatters: [CpfInputFormatter()],
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          label: Text('CPF'),
                          hintText: '123.456.789-00',
                        ),
                        keyboardType: TextInputType.number,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator: (String? value) {
                          String erros = '';
                          List<bool> erroAnterior = [false];
                          if (value == null || value.isEmpty || value == ' ') {
                            erros += 'Campos vazios não são aceitos';
                            erroAnterior[0] = true;
                          }
                          if (!AllValidations.isCpf(value!)) {
                            erros += erroAnterior[0] ? '\n' : '';
                            erros += 'Insira um CPF válido';
                          }
                          return erros.isEmpty ? null : erros;
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: TextFormField(
                        controller: emailCtrl,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          label: Text('E-mail'),
                          hintText: 'exemplo@exemplo.com',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator: (String? value) {
                          String erros = '';
                          List<bool> erroAnterior = [false];
                          if (value == null || value.isEmpty || value == ' ') {
                            erros += 'Campos vazios não são aceitos';
                            erroAnterior[0] = true;
                          }
                          if (!AllValidations.isEmail(value!)) {
                            erros += erroAnterior[0] ? '\n' : '';
                            erros += 'Insira um e-mail válido';
                          }
                          return erros.isEmpty ? null : erros;
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: TextFormField(
                        controller: senhaCtrl,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.key),
                            label: const Text('Senha'),
                            suffixIcon: IconButton(
                                icon: isPasswordInvisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off_outlined),
                                onPressed: () => setState(() {
                                      isPasswordInvisible =
                                          !isPasswordInvisible;
                                    }))),
                        obscureText: isPasswordInvisible,
                        enableSuggestions: false,
                        autocorrect: false,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator: (String? value) {
                          String erros = '';
                          List<bool> erroAnterior = [false];
                          if (value == null || value.isEmpty || value == ' ') {
                            erros += 'Campos vazios não são aceitos';
                            erroAnterior[0] = true;
                          }
                          if (!AllValidations.isStrongPassword(value!)) {
                            erros += erroAnterior[0] ? '\n' : '';
                            erros += 'Insira uma senha mais forte.';
                          }
                          return erros.isEmpty ? null : erros;
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            label: Text('Confirmar Senha')),
                        obscureText: isPasswordInvisible,
                        enableSuggestions: false,
                        autocorrect: false,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator: (String? value) {
                          String erros = '';
                          List<bool> erroAnterior = [false];
                          if (value == null || value.isEmpty || value == ' ') {
                            erros += 'Campos vazios não são aceitos';
                            erroAnterior[0] = true;
                          }
                          if (value != senhaCtrl.text) {
                            erros += erroAnterior[0] ? '\n' : '';
                            erros += 'As senhas devem ser iguais.';
                          }
                          return erros.isEmpty ? null : erros;
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: TextFormField(
                        controller: numCtrl,
                        inputFormatters: [PhoneNumberInputFormatter()],
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone_android),
                            label: Text('Número de telefone')),
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator: (String? value) {
                          String erros = '';
                          List<bool> erroAnterior = [false];
                          if (value == null || value.isEmpty || value == ' ') {
                            erros += 'Campos vazios não são aceitos';
                            erroAnterior[0] = true;
                          }
                          if (!AllValidations.isPhoneNumber(value!)) {
                            erros += erroAnterior[0] ? '\n' : '';
                            erros += 'Insira um número de telefone válido';
                          }
                          return erros.isEmpty ? null : erros;
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      visible: isTecnico,
                      child: Column(
                        children: [
                          FractionallySizedBox(
                            widthFactor: 0.9,
                            child: TextFormField(
                              controller: bioCtrl,
                              decoration: const InputDecoration(
                                label: Text('Um pouco sobre você'),
                                prefixIcon: Icon(Icons.badge_outlined),
                                hintText:
                                    'Áreas de atuação\nEspecializações\nDisponibilidade',
                              ),
                              autocorrect: true,
                              enableSuggestions: true,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              minLines: 3,
                              maxLines: 4,
                              maxLength: 300,
                              validator: (String? value) {
                                String erros = '';
                                if (value == null ||
                                    value.isEmpty ||
                                    value == ' ') {
                                  erros += 'Campos vazios não são aceitos\n';
                                }
                                if (value!.split(" ").length <= 10) {
                                  erros +=
                                      'A Bio deve conter no mínimo 10 palavras\n';
                                }
                                return erros.isEmpty ? null : erros;
                              },
                            ),
                          ),
                          const SizedBox(height: 5),
                          FractionallySizedBox(
                              widthFactor: 0.9,
                              child: MaterialButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () => pickFile(),
                                  child: IgnorePointer(
                                    child: TextFormField(
                                        validator: isTecnico
                                            ? (String? value) {
                                                String erros = '';
                                                if (value ==
                                                    'Selecione um ou mais certificados') {
                                                  erros +=
                                                      'Você precisa inserir ao menos um certificado.';
                                                }
                                                return erros.isEmpty
                                                    ? null
                                                    : erros;
                                              }
                                            : (String? value) {
                                                String erros = '';
                                                if (value !=
                                                    'Selecione um ou mais certificados') {
                                                  erros +=
                                                      'Você precisa inserir ao menos um certificado.';
                                                  return erros.isEmpty
                                                      ? null
                                                      : erros;
                                                }
                                                return erros.isEmpty
                                                    ? null
                                                    : erros;
                                              },
                                        readOnly: true,
                                        controller: qtdCertificados,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide:
                                                    BorderSide(width: 10)),
                                            prefixIcon:
                                                Icon(Icons.file_upload))),
                                  ))),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            isTecnico
                                ? _showMyDialog()
                                : showSnackBar(
                                    'Cadastrou-se como usuário comum', context);
                          }
                        },
                        child: const Text('ENVIAR'),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: GestureDetector(
                          onTap: () => widget.comesFromLogin != null
                              ? Navigator.pop(context)
                              : Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const Login(comesFromSignUp: true))),
                          child: RichText(
                              text: const TextSpan(
                                  text: 'Já tem uma conta? ',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: 'Realizar login',
                                    style: TextStyle(color: Colors.blueAccent))
                              ])),
                        )),
                  ],
                )),
          ),
        )
      ],
    ));
  }
}

class CpfInputFormatter extends TextInputFormatter {
  static const int _cpfLength = 11;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == _cpfLength) {
      String formattedText = _formatCpf(newValue.text);
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.fromPosition(
            TextPosition(offset: formattedText.length)),
      );
    }
    return newValue;
  }

  String _formatCpf(String cpf) {
    String digitsOnly = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.length > _cpfLength) {
      digitsOnly = digitsOnly.substring(0, _cpfLength);
    }
    String formattedCpf =
        '${digitsOnly.substring(0, 3)}.${digitsOnly.substring(3, 6)}.${digitsOnly.substring(6, 9)}-${digitsOnly.substring(9)}';
    return formattedCpf;
  }
}

class PhoneNumberInputFormatter extends TextInputFormatter {
  static const int _phoneNumberLength = 11;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == _phoneNumberLength) {
      String formattedText = _formatPhoneNumber(newValue.text);
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.fromPosition(
            TextPosition(offset: formattedText.length)),
      );
    }
    return newValue;
  }

  String _formatPhoneNumber(String phoneNumber) {
    String digitsOnly = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.length > _phoneNumberLength) {
      digitsOnly = digitsOnly.substring(0, _phoneNumberLength);
    }
    String formattedPhoneNumber =
        '(${digitsOnly.substring(0, 2)}) ${digitsOnly.substring(2, 7)}-${digitsOnly.substring(7)}';
    return formattedPhoneNumber;
  }
}
