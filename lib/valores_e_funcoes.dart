import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

bool isIOS = Platform.isIOS;

var usuario = {
  'nome': 'Francisco',
  'imagem':
      'https://scontent.fcaw3-1.fna.fbcdn.net/v/t1.18169-9/227059_398887146857886_1609713474_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=cdbe9c&_nc_ohc=mnNto5yvsJYAX8weDnU&_nc_ht=scontent.fcaw3-1.fna&oh=00_AfCUFOr3rSohVwwa37xOj-Sfo1Fe97Vgn7fHewIcN0dQtQ&oe=6463F925',
  'imagemfundo':
      'https://w0.peakpx.com/wallpaper/779/158/HD-wallpaper-fluminense-fc-paint-art-logo-creative-brazilian-football-team-brazilian-serie-a-emblem-burgundy-background-grunge-style-rio-de-janeiro-brazil-football.jpg',
  'isTecnico': true,
};

List<Map<String, dynamic>> categorias = [
  {
    'categoria': 'Assistência técnica em informática',
    'subcategoria': [
      'Manutenção de computadores e dispositivos eletrônicos',
      'Configuração de software e hardware',
      'Remoção de vírus e malware',
      'Diagnóstico e solução de problemas',
      'Recuperação de dados perdidos',
    ],
  },
  {
    'categoria': 'Consultoria em Tecnologia da Informação',
    'subcategoria': [
      'Aconselhamento sobre equipamentos e softwares',
      'Seleção de equipamentos e softwares adequados',
      'Análise de desempenho de sistemas',
      'Análise de risco e estratégia de backup',
      'Análise de sistemas e processos',
      'Planejamento estratégico de TI',
      'Gestão de projetos de TI',
      'Consultoria geral em segurança da informação',
    ],
  },
  {
    'categoria': 'Suporte técnico em informática',
    'subcategoria': [
      'Reparo de hardware',
      'Solução de problemas de software',
      'Instalação de software',
      'Configuração de rede',
      'Serviços de backup',
      'Serviços de segurança',
    ],
  },
  {
    'categoria': 'Serviços de treinamento',
    'subcategoria': [
      'Treinamento de usuários em softwares específicos',
      'Treinamento de segurança da informação',
      'Treinamento em técnicas de manutenção preventiva',
      'Treinamento em gerenciamento de rede',
      'Treinamento em administração de banco de dados',
    ],
  },
  {
    'categoria': 'Desenvolvimento de software',
    'subcategoria': [
      'Desenvolvimento de aplicativos móveis',
      'Desenvolvimento de software personalizado',
      'Desenvolvimento de software empresarial',
      'Desenvolvimento de software para jogos',
      'Desenvolvimento de software de automação',
      'Implementação de bancos de dados',
      'Design de software',
    ],
  },
  {
    'categoria': 'Manutenção de software',
    'subcategoria': [
      'Manutenção e atualização de sites existentes',
      'Otimização dos mecanismos',
    ],
  },
  {
    'categoria': 'Serviços de inteligência artificial',
    'subcategoria': [
      'Desenvolvimento de algoritmos de aprendizado de máquina',
      'Desenvolvimento de "chatbots" e assistentes virtuais',
      'Análise de dados e processamento de linguagem natural',
      'Integração de sistemas de inteligência artificial',
    ],
  },
  {
    'categoria': 'Implementação de infraestrutura de TI',
    'subcategoria': [
      'Planejamento e implementação de redes',
      'Instalação e configuração de servidores',
      'Virtualização de servidores',
      'Armazenamento em rede',
      'Configuração de roteadores e switches',
      'Gerenciamento de redes',
    ],
  },
  {
    'categoria': 'Segurança cibernética',
    'subcategoria': [
      'Teste de penetração',
      'Análise de vulnerabilidades',
      'Monitoramento de segurança',
      'Resposta a incidentes de segurança',
      'Auditoria de segurança',
      'Configuração de firewalls e sistemas de segurança',
    ],
  },
  {
    'categoria': 'Design gráfico e multimídia',
    'subcategoria': [
      'Design gráfico para impressão e web',
      'Design de interfaces de usuário',
      'Design de animação e gráficos em movimento',
      'Edição de vídeo e produção audiovisual',
      'Fotografia e edição de fotos',
    ],
  },
];

openUrl(url) async {
  //modificar o androidmanifest caso queira abrir links http
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  } else {
    throw Exception('Could not launch $url');
  }
}

sendEmail() {
  Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'Joaopedroalmeida2004@gmail.com',
  );

  launchUrl(emailLaunchUri);
}

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

class Contract {
  List imageLinks;
  String title;
  String description;
  int categoryId;
  String contractor;
  DateTime requestDate;
  String city;
  int urgencyLevel;
  int locomotionLevel;
  int toolLevel;
  //String foo;

  Contract({
    required this.imageLinks,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.contractor,
    required this.requestDate,
    required this.city,
    required this.urgencyLevel,
    required this.locomotionLevel,
    required this.toolLevel,
    /*required this.foo*/
  });
  static List<Contract> contracts = [
    Contract(
      imageLinks: [
        'https://images.anandtech.com/doci/14498/2019-06-01%2010.49.51.jpg'
      ],
      title: 'Computador não liga',
      description:
          'Estava eu numa noite jogando meu Paladins, me divertindo como sempre. De repente ouço um raio ensurdecedor nas proximidades. Caiu a luz na minha casa toda. Quando o liguei, o computador começou a ele não responder, percebi que o computador estava muito quente e havia uma fumaça saindo dele. Desliguei o computador instantaneamente. Desde que desliguei o computador, não o levei para nenhuma assistência técnica. Não sei o que aconteceu ou se é reparável, mas o computador foi muito caro, então venho aqui para buscar um técnico responsável que o conserte sem que nada de errado ocorra.',
      categoryId: 0,
      contractor: 'Contractor',
      requestDate: DateTime.now(),
      city: 'Itaperuna',
      urgencyLevel: 1,
      locomotionLevel: 1,
      toolLevel: 1,
    ),
    Contract(
      imageLinks: [
        'https://upload.wikimedia.org/wikipedia/commons/e/e8/Tesla_logo.png'
      ],
      title: 'A Tesla chegou!',
      description:
          'A empresa líder em tecnologia, Tesla, acaba de chegar ao Brasil e está em busca de serviços de redes de computadores de alta qualidade. Como uma das maiores e mais influentes empresas de tecnologia do mundo, a Tesla está comprometida em oferecer nossos melhores serviços a seus clientes em todo o mundo. Com o aumento das restrições sob a taxa de emissão de gases poluentes em toda a América Latina, a Tesla reconheceu o Brasil como um mercado crucial para seus negócios e está buscando parcerias com fornecedores de serviços de redes de computadores locais para ajudar a suportar suas operações. A empresa está procurando por fornecedores de serviços de redes de computadores que tenham uma ampla compreensão das necessidades e desafios únicos do mercado brasileiro, além de habilidades técnicas avançadas em configuração e manutenção de redes. Além disso, a Tesla valoriza parceiros que possam oferecer soluções personalizadas e flexíveis para atender às necessidades variadas de seus clientes. Se você é um provedor de serviços de redes de computadores no Brasil e está procurando por uma oportunidade de trabalhar com uma empresa líder em tecnologia, então a Tesla gostaria de ouvir de você. Por favor, entre em contato com a equipe de aquisições da empresa para discutir como você pode se tornar um parceiro valioso na jornada da Tesla no Brasil.',
      categoryId: 0,
      contractor: 'Tesla Inc.',
      requestDate: DateTime.now(),
      city: 'Itaperuna',
      urgencyLevel: 3,
      locomotionLevel: 1,
      toolLevel: 2,
    ),
    Contract(
      imageLinks: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Instituto_Federal_Fluminense_-_Marca_Vertical_2015.svg/800px-Instituto_Federal_Fluminense_-_Marca_Vertical_2015.svg.png'
      ],
      title: 'Aplicativo Escolar',
      description:
          'O Instituto Federal Fluminense está buscando programadores capazes de criar, do zero, um aplicativo mobile para mapear e auxiliar nossos estudantes. Como escola, estamos comprometidos em preparar nossos estudantes para o mundo de hoje e o futuro, e acreditamos que a presença de um aplicativo ajude aos novos estudantes a se acostumar com o ambiente. O aplicativo, possivelmente se chamaria LocalIFF, e, deve obrigatoriamente conter: informação específica de cada curso, com seus professores, coordenadores e específicos; Dados do estudante e de cada usuário cadastrado; Funções para Reservar salas; E etc. Se você se acha capaz de realizar este pedido, entre em contato conosco o mais breve possível.',
      categoryId: 0,
      contractor: 'Instituto Federal Fluminense',
      requestDate: DateTime.now(),
      city: 'Itaperuna',
      urgencyLevel: 2,
      locomotionLevel: 3,
      toolLevel: 3,
    ),
    Contract(
      imageLinks: [
        'https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2023/01/26/investimentos-sustentaveis-1jyajo3e5uqsw.jpg'
      ],
      title: 'IA para investir',
      description:
          'Olá, como vai? Eu estou procurando por alguém com habilidades incríveis em programação de inteligência artificial para me ajudar com um projeto. Estou interessado em criar uma IA que seja capaz de ler o mercado de ações e fornecer análises e previsões precisas. Assim, com a IA garantindo no mínimo 70% de precisão nas previsões, ela investirá automaticamente o saldo da minha conta bancária e retornará os ganhos quando os valores estiverem mais propensos a cair. Eu sei que você certamente é um programador talentoso e que poderá me ajudar, então, já que eu não tenho dinheiro no momento, lhe recompensarei com 1/4 de todos os ganhos. Assim, todos saem ganhando. Se você estiver interessado em explorar este projeto comigo, adoraria conversar mais sobre isso e fechar o negócio. Deixe-me saber se você está disponível para uma conversa informal e se está interessado em se aprofundar nesse projeto comigo. Eu apreciaria muito a sua ajuda e estou ansioso para trabalhar juntos!',
      categoryId: 0,
      contractor: 'Instituto Federal Fluminense',
      requestDate: DateTime.now(),
      city: 'Itaperuna',
      urgencyLevel: 2,
      locomotionLevel: 3,
      toolLevel: 1,
    ),
    Contract(
      imageLinks: [
        'semimagem'
        'https://adding.info/image/ratio-rectangle/ratio-of-4-to-1-rectangle.png'
      ],
      title: 'Title',
      description: 'Description',
      categoryId: 0,
      contractor: 'Contractor',
      requestDate: DateTime.now(),
      city: 'City',
      urgencyLevel: 3,
      locomotionLevel: 2,
      toolLevel: 3,
      //foo: 'foo',
    ),
  ];
}

class Categories {
  String imageLink;
  String name;
  List<String> subcategories = [];
  //String foo;

  Categories({
    required this.imageLink,
    required this.name,
    required this.subcategories,
    /*required this.foo*/
  });
  static List<Categories> contracts = [
    Categories(imageLink: 'ImageLink', name: 'Name', subcategories: [
      'Subcategory 1',
      'Subcategory 2',
      'Subcategory 3',
    ]),
    Categories(imageLink: 'ImageLink', name: 'Name', subcategories: [
      'Subcategory 1',
      'Subcategory 2',
      'Subcategory 3',
    ]),
  ];
}

checaCategoriaProvisorio(int id) {
  if (id == 0) {
    return 'Assistência técnica em informática';
  } else {
    debugPrint('Categoria não encontrada');
    return 'Categoria não encontrada';
  }
}
