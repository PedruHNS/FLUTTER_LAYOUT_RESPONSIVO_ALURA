import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/highlight_item.dart';

class HighlightPage extends StatelessWidget {
  final ScrollController scrollcontroller;
  const HighlightPage({super.key, required this.scrollcontroller});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> item =
        List<Map<String, dynamic>>.from(destaques);
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
                  "DESTAQUES",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          MediaQuery.of(context).orientation == Orientation.landscape
              ? SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return HighlightItem(
                        imageURI: item[index]["image"],
                        itemTitle: item[index]["name"],
                        itemPrice: item[index]["price"],
                        itemDescription: item[index]["description"]);
                  },
                )
              : SliverList.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return HighlightItem(
                        imageURI: item[index]["image"],
                        itemTitle: item[index]["name"],
                        itemPrice: item[index]["price"],
                        itemDescription: item[index]["description"]);
                  }),
        ],
      ),
    );
  }
}


// Column(
//         children: [
//           const Text(
//             "DESTAQUES",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//          
//               },
//             ),
//           ),
//         ],
//       ),