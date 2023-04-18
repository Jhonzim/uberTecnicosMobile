import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'valores_e_funcoes.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  double dR = 1;
  double sQ = 1;

  List<String> categorias = [
    'Manutenção de computadores e celulares',
    'Programação para dispositivos moveis',
    'Redes de computadores',
    'Inteligências artificiais',
    'Programação para web',
    'Automação de processos',
    'Desenvolvimento de jogos',
    'Engenheiro de dados'
  ];

  TextEditingController searchCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: buildStandardDrawer(context),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('TECH SHARE'),
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 11.h,
                    child: FractionallySizedBox(
                      widthFactor: 0.95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Boas-vindas, ${usuario['nome']}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                          TextField(
                            controller: searchCtrl,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                hintText: 'O que procura hoje?',
                                fillColor: Color.fromARGB(20, 0, 0, 0),
                                filled: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    //Categorias
                    height: 35.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(
                          decelerationRate: ScrollDecelerationRate.fast),
                      itemCount: categorias.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          onPressed: () => setState(() {
                            showSnackBar(
                                'Pesquisar por ${categorias[index]}', context);
                          }),
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 20.w,
                                height: 20.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black26)),
                                child: Center(
                                  child: Image.asset(
                                    'images/1_1.png',
                                    height: 12.w,
                                    width: 12.w,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                                child: Text(
                                  categorias[index],
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SliverFillViewport(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    color: Colors.black.withAlpha(20),
                    child: Column(
                      children: [
                        Container(
                          height: 20.h,
                          width: 90.w,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('images/tecnicoolhando.jpg'),
                                  fit: BoxFit.fill)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Acessar\nAcompanhe seus pedidos'),
                                OutlinedButton(
                                    onPressed: () => setState(() {}),
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)))),
                                    child: const Icon(Icons.arrow_right))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SliverPadding(padding: EdgeInsets.all(20)),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Slider(
                    value: dR,
                    min: 0.1,
                    max: 3,
                    onChanged: (value) => setState(() {
                      dR = value;
                    }),
                  ),
                  Slider(
                    value: sQ,
                    min: 0.1,
                    max: 3,
                    onChanged: (value) => setState(() {
                      sQ = value;
                    }),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: ColoredBox(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ListWheelScrollView(
                      diameterRatio: dR,
                      squeeze: sQ,
                      itemExtent: 100,
                      children: const [
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading: Icon(Icons.local_activity, size: 50),
                            title: Text('Activity'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading: Icon(Icons.local_airport, size: 50),
                            title: Text('Airport'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading: Icon(Icons.local_atm, size: 50),
                            title: Text('ATM'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading: Icon(Icons.local_bar, size: 50),
                            title: Text('Bar'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading: Icon(Icons.local_cafe, size: 50),
                            title: Text('Cafe'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading: Icon(Icons.local_car_wash, size: 50),
                            title: Text('Car Wash'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading:
                                Icon(Icons.local_convenience_store, size: 50),
                            title: Text('Heart Shaker'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading: Icon(Icons.local_dining, size: 50),
                            title: Text('Dining'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading: Icon(Icons.local_drink, size: 50),
                            title: Text('Drink'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading: Icon(Icons.local_florist, size: 50),
                            title: Text('Florist'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading: Icon(Icons.local_gas_station, size: 50),
                            title: Text('Gas Station'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                        ColoredBox(
                          color: Color.fromARGB(30, 255, 255, 255),
                          child: ListTile(
                            leading: Icon(Icons.local_grocery_store, size: 50),
                            title: Text('Grocery Store'),
                            subtitle: Text('Description here'),
                          ),
                        ),
                      ],
                    ),
                  )
                  /*Center(
                  child: Text(
                    'Seja bem-vindo, ${usuario['nome'].toString()}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),*/
                  ),
            ),
          ],
        ));
  }
}
