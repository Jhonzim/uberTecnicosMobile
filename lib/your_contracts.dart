import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_share/valores_e_funcoes.dart';

import 'contractdetails.dart';

class YourContracts extends StatefulWidget {
  const YourContracts({super.key});

  @override
  State<YourContracts> createState() => _YourContractsState();
}

class _YourContractsState extends State<YourContracts> {
  bool isGrid = false;
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
                      isGrid = !isGrid;
                    }),
                icon: !isIOS
                    ? isGrid
                        ? const Icon(Icons.grid_view_rounded)
                        : const Icon(Icons.view_list_rounded)
                    : isGrid
                        ? const Icon(CupertinoIcons.square_grid_2x2)
                        : const Icon(CupertinoIcons.list_bullet))
          ],
          floating: true,
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 1.h),
          sliver: SliverList(
            delegate: SliverChildListDelegate(List.generate(Contract.contracts.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: /*InkWell(
                  onTap: () => setState(() {
                    
                  }),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Ink.image(
                            image: const AssetImage(
                              'images/1_1.png',
                            ),
                            width: 20.w,
                            height: 20.w,
                            fit: BoxFit.cover
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Contract.contracts[index].title),
                              Text(Contract.contracts[index].description, maxLines: 2, overflow: TextOverflow.ellipsis,),
                              Text(Contract.contracts[index].city),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: !isIOS ? const Icon(Icons.keyboard_arrow_right) : const Icon(CupertinoIcons.right_chevron)
                        )
                      ],
                    ),
                            ),
                ),*/Card(
                  child: ListTile(
                    leading: Hero(
                      tag: Contract.contracts[index].imageLinks[0],
                      child: Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            Contract.contracts[index].imageLinks[0],
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Image.asset('images/imageNotFound.png',
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
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: 16
                          ),
                          children: <TextSpan>[
                            TextSpan(text: Contract.contracts[index].description,
                              style: const TextStyle(
                                fontSize: 14
                              )
                            )
                          ]
                      ),
                    ),
                    subtitle: Text(Contract.contracts[index].city),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContractDetails(contract: Contract.contracts[index],))),
                  ),
                ),
              );
            }))),
        ),
      ],
    ));
  }
}

/*
InkWell(
                  onTap: () => setState(() {
                    
                  }),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Ink.image(
                            image: const AssetImage(
                              'images/1_1.png',
                            ),
                            width: 20.w,
                            height: 20.w,
                            fit: BoxFit.cover
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Contract.contracts[index].title),
                              Text(Contract.contracts[index].description, maxLines: 2, overflow: TextOverflow.ellipsis,),
                              Text(Contract.contracts[index].city),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: !isIOS ? const Icon(Icons.keyboard_arrow_right) : const Icon(CupertinoIcons.right_chevron)
                        )
                      ],
                    ),
                            ),
                ),
 */