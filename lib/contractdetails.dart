import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_share/valores_e_funcoes.dart';
import 'package:intl/intl.dart';

class ContractDetails extends StatefulWidget {
  const ContractDetails({required this.contract, super.key});

  final Contract contract;

  @override
  State<ContractDetails> createState() => _ContractDetailsState();
}

class _ContractDetailsState extends State<ContractDetails> {
  bool isFavorite = false;

  @override
  void initState() {
    initializeDateFormatting('pt');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var requestDate =
        DateFormat.MMMMd('pt').format(widget.contract.requestDate);
    DateTime dueDate = DateTime
        .now(); //todo: colocar uma data de fim na classe pq assim sempre vai ser o mesmo prazo
    if (widget.contract.urgencyLevel == 1) {
      dueDate = DateTime(
          widget.contract.requestDate.year,
          widget.contract.requestDate.month + 3,
          widget.contract.requestDate.day);
    } else if (widget.contract.urgencyLevel == 3) {
      dueDate = DateTime(
          widget.contract.requestDate.year,
          widget.contract.requestDate.month,
          widget.contract.requestDate.day + 7);
    }
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                  isFavorite
                      ? showSnackBar('Adicionado aos favoritos.', context)
                      : showSnackBar('Removido dos favoritos.', context);
                });
              },
              icon: isFavorite
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            ),
          ],
        ),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [//todo: fazer um design responsivo
                      Container(
                        width: 100.w,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            onError: (exception, stackTrace) => Image.asset('images/imageNotFound.png',
                                    fit: BoxFit.fitHeight),
                            image: NetworkImage(widget.contract.imageLinks[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 100.w,
                        height: 280,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Hero(
                            tag: widget.contract.imageLinks[0],
                            child: Image.network(
                                widget.contract.imageLinks[0],
                                fit: BoxFit.cover, errorBuilder:
                                    (BuildContext context, Object exception,
                                        StackTrace? stackTrace) {
                              return Image.asset('images/imageNotFound.png',
                                  fit: BoxFit.fitHeight);
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    //apenas para a fractionallysizedbox funcionar
                    child: FractionallySizedBox(
                      widthFactor: 0.95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            checaCategoriaProvisorio(
                                widget.contract.categoryId),
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color
                                    ?.withOpacity(0.7)),
                          ),
                          Text(requestDate)
                        ],
                      ),
                    ),
                  ),
                  Align(
                    //apenas para a fractionallysizedbox funcionar
                    child: FractionallySizedBox(
                      widthFactor: 0.98,
                      child: Text(widget.contract.title,
                          style: const TextStyle(fontSize: 19, height: 1.5)),
                    ),
                  ),
                  Align(
                    //apenas para a fractionallysizedbox funcionar
                    child: FractionallySizedBox(
                      widthFactor: 0.95,
                      child: Text(widget.contract.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              !isIOS
                                  ? const Icon(Icons.accessible_forward)
                                  : const Icon(
                                      Icons.accessible_forward_outlined),
                              widget.contract.locomotionLevel == 1
                                  ? const Text('Requer locomoção')
                                  : widget.contract.locomotionLevel == 2
                                      ? const Text('Não especificado')
                                      : const Text('Não requer locomoção'),
                              const SizedBox(width: 5),
                              !isIOS
                                  ? const Icon(Icons.build)
                                  : const Icon(CupertinoIcons.wrench),
                              widget.contract.locomotionLevel == 1
                                  ? const Text('Requer ferramentas')
                                  : widget.contract.locomotionLevel == 2
                                      ? const Text('Não especificado')
                                      : const Text('Não requer ferramentas'),
                              const SizedBox(width: 5),
                              !isIOS
                                  ? const Icon(Icons.event)
                                  : const Icon(CupertinoIcons.calendar_today),
                              widget.contract.urgencyLevel == 1
                                  ? Text(DateFormat.MMMMd('pt').format(dueDate))
                                  : widget.contract.urgencyLevel == 2
                                      ? const Text('Prazo indefinido')
                                      : Text(DateFormat.MMMMd('pt')
                                          .format(dueDate)),
                              const SizedBox(width: 5),
                            ]),
                      )
                      /*widget.contract.locomotionLevel==1 ? !isIOS ? const Icon(Icons.accessible_forward) : const Icon(Icons.accessible_forward_outlined)
                    : widget.contract.locomotionLevel==2 ? const Icon(Icons.question_mark) : const Icon(CupertinoIcons.question),
                      !isIOS ? const Icon(Icons.not_accessible) :const Icon(Icons.not_accessible_outlined),
                  widget.contract.toolLevel==1 ? !isIOS ? const Icon(Icons.build) : const Icon(CupertinoIcons.wrench)
                    : widget.contract.toolLevel==2 ? const Icon(Icons.question_mark) : const Icon(CupertinoIcons.question),
                      !isIOS ? const Icon(Icons.dangerous) :const Icon(CupertinoIcons.xmark_octagon),
                  widget.contract.urgencyLevel==1 ? !isIOS ? const Icon(Icons.event) : const Icon(Icons.calendar_today)
                    : widget.contract.urgencyLevel==2 ? const Icon(Icons.question_mark) : const Icon(CupertinoIcons.question),
                      !isIOS ? const Icon(Icons.dangerous) :const Icon(CupertinoIcons.xmark_octagon),
                    */
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.65,
                      child: ElevatedButton(
                          onPressed: () => setState(() {}),
                          child: Text(
                              'Aceitar contrato de ${widget.contract.contractor.split(" ")[0]}')),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
