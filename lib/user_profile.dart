import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_share/editar_perfil.dart';
import 'package:tech_share/no_login/landing_page.dart';
import 'package:tech_share/privacy_policy.dart';
import 'package:tech_share/terms_of_service.dart';
import 'package:tech_share/valores_e_funcoes.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isTrue = false;
  bool isTrue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('Perfil'),
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 1.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(usuario['imagem'].toString()),
                      ),
                      title: Text(usuario['nome'].toString()),
                      trailing: IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditarPerfil(
                                        dadosPerfil: [
                                          usuario['nome'].toString(),
                                          usuario['imagemfundo'].toString()
                                        ]))),
                        icon: !isIOS
                            ? const Icon(Icons.edit)
                            : const Icon(CupertinoIcons.pencil),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .color!
                                  .withOpacity(0.2),
                              width: 1)),
                      child: ListTile(
                        onTap: () => setState(() {}),
                        leading: !isIOS
                            ? const Icon(Icons.lock)
                            : const Icon(CupertinoIcons.lock),
                        title: const Text('Mudar senha'),
                        trailing: !isIOS
                            ? const Icon(Icons.keyboard_arrow_right)
                            : const Icon(CupertinoIcons.right_chevron),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .color!
                                  .withOpacity(0.2),
                              width: 1)),
                      child: ListTile(
                        onTap: () => setState(() {}),
                        leading: !isIOS
                            ? const Icon(Icons.person_pin_rounded)
                            : const Icon(CupertinoIcons.person_crop_square),
                        title: const Text('Mudar outra coisa sei lá'),
                        trailing: !isIOS
                            ? const Icon(Icons.keyboard_arrow_right)
                            : const Icon(CupertinoIcons.right_chevron),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(20)),
                          border: Border.all(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .color!
                                  .withOpacity(0.2),
                              width: 1)),
                      child: ListTile(
                        onTap: () => setState(() {}),
                        leading: !isIOS
                            ? const Icon(Icons.lock)
                            : const Icon(CupertinoIcons.lock),
                        title: const Text('Atualizar dados'),
                        trailing: !isIOS
                            ? const Icon(Icons.keyboard_arrow_right)
                            : const Icon(CupertinoIcons.right_chevron),
                      ),
                    ),
                  ],
                ),
              ),
              const ListTile(
                subtitle: Text('CONFIGURAÇÕES DO APLICATIVO',
                    style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                title: const Text('Notificações'),
                leading: !isIOS
                    ? const Icon(Icons.notifications)
                    : const Icon(CupertinoIcons.bell),
                onTap: () => setState(() {
                  isTrue = !isTrue;
                }),
                trailing: !isIOS
                    ? Switch(
                        value: isTrue,
                        onChanged: (value) => setState(() {
                              isTrue = !isTrue;
                            }))
                    : CupertinoSwitch(
                        value: isTrue,
                        onChanged: (value) => setState(() {
                          isTrue = !isTrue;
                        }),
                      ),
              ),
              ListTile(
                title: const Text('Tema escuro'),
                leading: !isIOS
                    ? const Icon(Icons.brightness_2)
                    : const Icon(CupertinoIcons.moon),
                onTap: () => setState(() {
                  isTrue2 = !isTrue2;
                }),
                trailing: !isIOS
                    ? Switch(
                        value: isTrue2,
                        onChanged: (value) => setState(() {
                          isTrue2 = !isTrue2;
                        }),
                      )
                    : CupertinoSwitch(
                        value: isTrue2,
                        onChanged: (value) => setState(() {
                          isTrue2 = !isTrue2;
                        }),
                      ),
              ),
              const ListTile(
                subtitle: Text('CONTA',
                    style: TextStyle(
                      color: Colors.green,
                    )),
              ),
              ListTile(
                title: const Text('Detalhes da conta'),
                leading: !isIOS
                    ? const Icon(Icons.mail)
                    : const Icon(CupertinoIcons.mail),
                trailing: !isIOS
                    ? const Icon(Icons.keyboard_arrow_right)
                    : const Icon(CupertinoIcons.right_chevron),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditarPerfil(dadosPerfil: [
                              usuario['nome'].toString(),
                              usuario['imagemfundo'].toString()
                            ]))),
              ),
              ListTile(
                title: const Text('Sair da conta'),
                leading: !isIOS
                    ? const Icon(Icons.logout)
                    : const Icon(CupertinoIcons.square_arrow_right),
                trailing: !isIOS
                    ? const Icon(Icons.keyboard_arrow_right)
                    : const Icon(CupertinoIcons.right_chevron),
                onTap: () {
                  //TODO: Implementar logout
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LandingPage()),
                      (Route route) => false);
                  showSnackBar('Logout realizado com sucesso.', context);
                },
              ),
              const ListTile(
                subtitle: Text('MISCELÂNEO',
                    style: TextStyle(
                      color: Colors.green,
                    )),
              ),
              ListTile(
                title: const Text('Termos de serviço'),
                leading: !isIOS
                    ? const Icon(Icons.insert_drive_file)
                    : const Icon(CupertinoIcons.doc_text),
                trailing: !isIOS
                    ? const Icon(Icons.keyboard_arrow_right)
                    : const Icon(CupertinoIcons.right_chevron),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsOfService())),
              ),
              ListTile(
                title: const Text('Política de privacidade'),
                leading: !isIOS
                    ? const Icon(Icons.contact_page)
                    : const Icon(CupertinoIcons.doc_person),
                trailing: !isIOS
                    ? const Icon(Icons.keyboard_arrow_right)
                    : const Icon(CupertinoIcons.right_chevron),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicy())),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
