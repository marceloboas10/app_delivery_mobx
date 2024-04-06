import 'package:app_delivery_mobx/components/contador.dart';
import 'package:app_delivery_mobx/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Cartao extends StatelessWidget {
  const Cartao({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF6F6F6),
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 134),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(item.url),
              width: double.infinity,
              height: 50,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: FittedBox(
                child: Text(
                  item.nome,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text("R\$ ${item.preco.toStringAsFixed(2)}"),
            ),
            Observer(
                builder: (_) => Contador(
                      item: item,
                    )),
          ],
        ),
      ),
    );
  }
}
