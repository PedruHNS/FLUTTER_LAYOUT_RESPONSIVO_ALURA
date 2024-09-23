import 'package:flutter/material.dart';
import 'package:panucci_ristorante/components/main_drawer.dart';
import 'package:panucci_ristorante/screens/checkout_page.dart';
import 'package:panucci_ristorante/screens/drink_menu_page.dart';
import 'package:panucci_ristorante/screens/food_menu_page.dart';
import 'package:panucci_ristorante/screens/highlight_page.dart';
import 'package:panucci_ristorante/themes/app_colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  bool _isBottom = false;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      bool isTop = _scrollController.position.pixels == 0;
      if (!isTop) {
        setState(() {
          _isBottom = true;
        });
      } else {
        setState(() {
          _isBottom = false;
        });
      }
    } else {
      setState(() {
        _isBottom = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HighlightPage(scrollcontroller: _scrollController),
      FoodMenuPage(scrollcontroller: _scrollController),
      DrinkMenuPage(scrollcontroller: _scrollController),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ristorante Panucci"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.account_circle,
              size: 32,
            ),
          )
        ],
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: 'Destaques',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_bar),
            label: 'Bebidas',
          ),
        ],
        selectedItemColor: AppColors.bottomNavigationBarIconColor,
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
      body: pages[_currentPage],
      floatingActionButton: _isBottom
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CheckoutPage();
                }));
              },
              child: const Icon(Icons.point_of_sale),
            ),
    );
  }
}
