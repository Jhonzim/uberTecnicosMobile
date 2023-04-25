import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_share/bottom_nav_bar.dart';
import 'package:tech_share/valores_e_funcoes.dart';

import 'contractdetails.dart';

class YourContracts extends StatefulWidget {
  const YourContracts({super.key});

  @override
  State<YourContracts> createState() => _YourContractsState();
}

class _YourContractsState extends State<YourContracts>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  bool isGrid = false;

  @override
  void initState() {
    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    super.initState();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Seus contratos'),
          actions: [
            IconButton(
                onPressed: () => setState(() {
                      isGrid ? animation.reverse() : animation.forward();
                      isGrid = !isGrid;
                    }),
                icon: !isIOS
                    ? AnimatedIcon(
                        progress: animation, icon: AnimatedIcons.list_view)
                    : isGrid
                        ? const Icon(CupertinoIcons.square_grid_2x2)
                        : const Icon(CupertinoIcons.list_bullet))
          ],
          floating: true,
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 1.h),
          sliver: OrientationBuilder(builder: (context, orientation) {
            return SliverList(
                delegate: SliverChildListDelegate(
                    List.generate(Contract.contracts.length, (index) {
              if (orientation == Orientation.portrait || isGrid == false) {
                return Card(
                  child: ListTile(
                    leading: Hero(
                      tag: Contract.contracts[index].imageLinks[0],
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Image.network(
                            Contract.contracts[index].imageLinks[0],
                            height: double.maxFinite,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset('images/ImageNotFound.png',
                                  fit: BoxFit.cover);
                            },
                          ),
                        ),
                      ),
                    ),
                    title: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          text: '${Contract.contracts[index].title}\n',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                              fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                text: Contract.contracts[index].description,
                                style: const TextStyle(fontSize: 14))
                          ]),
                    ),
                    subtitle: Text(Contract.contracts[index].city),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContractDetails(
                              contract: Contract.contracts[index],
                            ))),
                  ),
                );
              } else {
                return Card(
                  child: GridTile(
                    child: Hero(
                      tag: Contract.contracts[index].imageLinks[0],
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Image.network(
                            Contract.contracts[index].imageLinks[0],
                            height: double.maxFinite,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset('images/ImageNotFound.png',
                                  fit: BoxFit.cover);
                            },
                          ),
                        ),
                      )
                    ),
                  )
                );
              }
            })));
          }),
        ),
      ],
    ));
  }
}


/*
Card(
    child: GridTile(
  child: Hero(
      tag: Contract.contracts[index].imageLinks[0],
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Image.network(
            Contract.contracts[index].imageLinks[0],
            height: double.maxFinite,
            fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset('images/ImageNotFound.png',
                  fit: BoxFit.cover);
            },
          ),
        ),
      )),
));
*/