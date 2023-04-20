import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'valores_e_funcoes.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

var recommendedCategory = categorias[3];
var recommendedCategoryName = recommendedCategory['categoria'];
var recommendedCategorySubcategories = recommendedCategory['subcategoria'];

class _IndexState extends State<Index> {
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
                  buildGreetings(),
                  buildYourContracts(),
                  buildYouQualify()
                ],
              ),
            ),
          ],
        ));
  }

  buildGreetings() {
    return Column(
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
                          fontSize: 16.sp, fontWeight: FontWeight.bold)),
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
              itemBuilder: (context, index) {
                var categoriaAtual = categorias[index];
                var nomeCategoria = categoriaAtual['categoria'];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () => setState(() {
                      showSnackBar('Pesquisar por "$nomeCategoria"', context);
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
                            '$nomeCategoria',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 9.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  buildYourContracts() {
    return ClipRRect(
      child: SizedBox(
        width: 90.w,
        height: 20.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'images/tecnicoolhando.jpg',
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        'Acessar',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Acompanhe seus contratos',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  OutlinedButton(
                    onPressed: () => setState(() {}),
                    style: ButtonStyle(
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(10)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      side: const MaterialStatePropertyAll(
                        BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: const Icon(Icons.arrow_right),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildYouQualify() {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Text(
                'Você se qualifica',
                style: TextStyle(
                  fontSize: 9.sp,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color
                      ?.withOpacity(0.5),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Text(
                recommendedCategoryName,
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            SizedBox(
                height: 35.w,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.fast),
                  itemCount: recommendedCategorySubcategories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          splashColor: Colors.green.withOpacity(0.5),
                          radius: 10,
                          onTap: () => setState(() {
                            showSnackBar(
                                'Pesquisar por "${recommendedCategorySubcategories[index]}"',
                                context);
                          }),
                          child: SizedBox(
                            width: 20.w,
                            height: 25.w,
                            child: Center(
                              child: Column(
                                children: [
                                  Ink.image(
                                    image: const AssetImage('images/1_1.png'),
                                    height: 20.w,
                                      width: 20.w,
                                      fit: BoxFit.cover,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        recommendedCategorySubcategories[index],
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 9.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
