import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EditarPerfil extends StatefulWidget {
  EditarPerfil({super.key, required this.dadosPerfil});
  List<String> dadosPerfil = [];

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('INTERMINADO'),
          floating: true,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: ListView.builder(
              itemCount: widget.dadosPerfil.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text('Dado $index'),
                title: Text(widget.dadosPerfil[index]),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
