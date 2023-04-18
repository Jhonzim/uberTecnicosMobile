import 'package:flutter/material.dart';

import 'valores_e_funcoes.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
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
            SliverFillViewport(
              delegate: SliverChildListDelegate(
                [
                  const Center(
                    child: Text('Não scrolle para baixo'),
                  )
                ],
              ),
            ),
            const SliverPadding(padding: EdgeInsets.all(20)),
            SliverFillRemaining(
              child: ColoredBox(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ListWheelScrollView(
                      itemExtent: 100,
                      children: const [
                        ListTile(
                          leading: Icon(Icons.local_activity, size: 50),
                          title: Text('Activity'),
                          subtitle: Text('Description here'),
                        ),
                        ListTile(
                          leading: Icon(Icons.local_airport, size: 50),
                          title: Text('Airport'),
                          subtitle: Text('Description here'),
                        ),
                        ListTile(
                          leading: Icon(Icons.local_atm, size: 50),
                          title: Text('ATM'),
                          subtitle: Text('Description here'),
                        ),
                        ListTile(
                          leading: Icon(Icons.local_bar, size: 50),
                          title: Text('Bar'),
                          subtitle: Text('Description here'),
                        ),
                        ListTile(
                          leading: Icon(Icons.local_cafe, size: 50),
                          title: Text('Cafe'),
                          subtitle: Text('Description here'),
                        ),
                        ListTile(
                          leading: Icon(Icons.local_car_wash, size: 50),
                          title: Text('Car Wash'),
                          subtitle: Text('Description here'),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.local_convenience_store, size: 50),
                          title: Text('Heart Shaker'),
                          subtitle: Text('Description here'),
                        ),
                        ListTile(
                          leading: Icon(Icons.local_dining, size: 50),
                          title: Text('Dining'),
                          subtitle: Text('Description here'),
                        ),
                        ListTile(
                          leading: Icon(Icons.local_drink, size: 50),
                          title: Text('Drink'),
                          subtitle: Text('Description here'),
                        ),
                        ListTile(
                          leading: Icon(Icons.local_florist, size: 50),
                          title: Text('Florist'),
                          subtitle: Text('Description here'),
                        ),
                        ListTile(
                          leading: Icon(Icons.local_gas_station, size: 50),
                          title: Text('Gas Station'),
                          subtitle: Text('Description here'),
                        ),
                        ListTile(
                          leading: Icon(Icons.local_grocery_store, size: 50),
                          title: Text('Grocery Store'),
                          subtitle: Text('Description here'),
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
