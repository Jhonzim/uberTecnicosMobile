import 'package:flutter/material.dart';
import 'package:tech_share/valores_e_funcoes.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillViewport(
            delegate: SliverChildListDelegate(
              [
                const Center(
                  child: Text(
                    'Listagem de contratos em andamento',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
  }
}
