import 'package:app_delivery_mobx/models/item.dart';
import 'package:app_delivery_mobx/store/carrinho_store.dart';
import 'package:app_delivery_mobx/store/item_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Contador extends StatelessWidget {
  Contador({super.key, required this.item});

  final ItemStore itemStore = ItemStore();
  final Item item;

  @override
  Widget build(BuildContext context) {
    final carrinhoStore = Provider.of<CarrinhoStore>(context);

    return Observer(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              if (itemStore.valorContador > 0) {
                itemStore.removeItem();
                carrinhoStore.removeCarrinho(item);
              }
            },
            child: const Icon(
              Icons.remove_circle_outline,
              size: 25,
            ),
          ),
          Text(itemStore.valorContador.toString()),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              itemStore.addItem();
              carrinhoStore.addCarinho(item);
            },
            child: const Icon(
              Icons.add_circle_outline,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
