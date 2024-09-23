import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/food_item.dart';

class FoodMenuPage extends StatelessWidget {
  final ScrollController scrollcontroller;
  const FoodMenuPage({super.key, required this.scrollcontroller});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> item =
        List<Map<String, dynamic>>.from(comidas);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
      child: CustomScrollView(
        controller: scrollcontroller,
        slivers: [
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  "CARDÁPIO",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverList.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return FoodItem(
                  itemTitle: item[index]["name"],
                  itemPrice: item[index]["price"],
                  imageURI: item[index]["image"],
                );
              }),
        ],
      ),
    );
  }
}
