import 'package:flutter/material.dart';

var usuario = {
  'nome': 'Francisco',
  'imagem':
      'https://scontent.fcaw3-1.fna.fbcdn.net/v/t1.18169-9/227059_398887146857886_1609713474_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=cdbe9c&_nc_ohc=mnNto5yvsJYAX8weDnU&_nc_ht=scontent.fcaw3-1.fna&oh=00_AfCUFOr3rSohVwwa37xOj-Sfo1Fe97Vgn7fHewIcN0dQtQ&oe=6463F925',
  'imagemfundo':
      'https://w0.peakpx.com/wallpaper/779/158/HD-wallpaper-fluminense-fc-paint-art-logo-creative-brazilian-football-team-brazilian-serie-a-emblem-burgundy-background-grunge-style-rio-de-janeiro-brazil-football.jpg',
  'isTecnico': true,
};

buildStandardDrawer(context) => Drawer(
  child: Column(
    children: [
      Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      image:
                          NetworkImage(usuario['imagemfundo'].toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.18,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.12),
                      CircleAvatar(
                        radius: 52.0,
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              NetworkImage(usuario['imagem'].toString()),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Text(usuario['nome'].toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18)),
                      Text(usuario['isTecnico'] == true
                          ? 'Usuário técnico'
                          : 'Usuário comum'),
                    ],
                  ),
                ),
              ],
            ),
            usuario['isTecnico'] != true
                ? ListTile(
                    leading: const Icon(Icons.add_circle),
                    title: const Text('Criar contratos'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                : const SizedBox(),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: Text(usuario['isTecnico'] != true
                  ? 'Contratos aceitos'
                  : 'Contratos criados'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            usuario['isTecnico'] == true
                ? ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('Contratos salvos'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                : const SizedBox(),
            usuario['isTecnico'] == true
                ? ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text('Recentes'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                : const SizedBox(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre nós'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
        height: MediaQuery.of(context).size.height * 0.09,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.settings),
                  Text('Configurações', style: TextStyle(fontSize: 16))
                ],
              ),
            ),
            const VerticalDivider(
              thickness: 0.5,
              width: 0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.logout),
                  Text('Sair da Conta', style: TextStyle(fontSize: 16))
                ],
              ),
            ),
          ],
        ),
      )
    ],
  ),
);

void showSnackBar(String texto, context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(texto),
  ));
}