import 'dart:io';
import 'package:all_validations_br/all_validations_br.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

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

  bool isPasswordInvisible = true;
  bool isTecnico = false;
  bool isLoading = false;

  FilePickerResult? result;
  PlatformFile? pickedFile;
  File? fileToDisplay;
  String _fileName = '';

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform.pickFiles(
        type: FileType.media,
        allowMultiple: false,
      );
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());

        debugPrint('Nome do arquivo: $_fileName');
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() {
          isTecnico = !isTecnico;
        }),
        isExtended: true,
        icon: const Icon(Icons.menu),
        label: Text(isTecnico
          ? 'Quero pedir serviços aqui'
          : 'Quero trabalhar aqui'),
      ),
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('CADASTRO'),
          floating: true,
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
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.key),
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
                            child: TextButton(
                              onPressed: () {
                                pickFile();
                              },
                              child: const Text('Inserir certificado'),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 400,
                            child: fileToDisplay != null ? Image.file(fileToDisplay!) : const Text('Selecione um arquivo.'),
                          )
                        ],
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (formKey.currentState!.validate()) {
                            // Process data.
                          }
                        },
                        child: const Text('ENVIAR'),
                      ),
                    ),
                  ],
                )),
          ),
        )
      ],
    ));
  }
}
