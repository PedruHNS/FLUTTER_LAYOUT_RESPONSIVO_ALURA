import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/drink_item.dart';

class DrinkMenuPage extends StatelessWidget {
  final ScrollController scrollcontroller;
  const DrinkMenuPage({super.key, required this.scrollcontroller});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> item =
        List<Map<String, dynamic>>.from(drinks);
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
                  "BEBIDAS",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 3
                      : 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 1.2
                      : 158 / 194,
            ),
            itemCount: item.length,
            itemBuilder: (context, index) {
              return DrinkItem(
                imageURI: item[index]["image"],
                itemTitle: item[index]["name"],
                itemPrice: item[index]["price"],
              );
            },
          ),
        ],
      ),
    );
  }
}
