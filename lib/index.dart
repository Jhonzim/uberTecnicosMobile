import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'onboarding_screen.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool isFirstTime =
      false; //usar shared preferences para saber se é ou não a primeira vez no app
  bool isLoggedIn = false; //checar se o usuário está logado
  @override
  Widget build(BuildContext context) {
    return isFirstTime
        ? const OnboardingScreen()
        : isLoggedIn
            ? const Corpo()
            : Cadastro();
  }
}

class Corpo extends StatefulWidget {
  const Corpo({super.key});

  @override
  State<Corpo> createState() => _CorpoState();
}

class _CorpoState extends State<Corpo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('TECH SHARE'),
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: Colors.red,
            child: const Center(child: Text('SliverToBoxAdapter')),
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          children: [
            Container(color: Colors.green, child: const Text('SliverGrid')),
            Container(color: Colors.blue, child: const Text('SliverGrid')),
            Container(color: Colors.orange, child: const Text('SliverGrid')),
            Container(color: Colors.purple, child: const Text('SliverGrid')),
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text('$index'),
                ),
                title: Text('SliverList item $index'),
              );
            },
            childCount: 10,
          ),
        ),
        SliverPersistentHeader(
          delegate: _MyPersistentHeaderDelegate(),
          pinned: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          sliver: SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('$index'),
                  ),
                  title: Text('$index'),
                );
              },
              childCount: 10,
            ),
          ),
        ),
        SliverFillViewport(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: 800,
                color: Colors.grey,
                child: const Center(
                  child: Text(
                    'SliverFillViewport',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Container(
            color: Colors.yellow,
            child: const Center(
              child: Text(
                'SliverFillRemaining',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class _MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'SliverPersistentHeader',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(_MyPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
