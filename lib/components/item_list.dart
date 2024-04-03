import 'package:app_delivery_mobx/cardapio.dart';
import 'package:app_delivery_mobx/components/cartao.dart';
import 'package:app_delivery_mobx/models/item.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.categoria});

  final String categoria;
  final List<Item> cardapio = todosOsItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 150),
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (cardapio[index].categoria == categoria) {
              return Cartao(item: cardapio[index]);
            } else {
              return Container();
            }
          },
          scrollDirection: Axis.horizontal,
          itemCount: cardapio.length,
        ),
      ),
    );
  }
}
