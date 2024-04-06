import 'package:app_delivery_mobx/components/categoria_text.dart';
import 'package:app_delivery_mobx/components/item_list.dart';
import 'package:app_delivery_mobx/components/search_input.dart';
import 'package:app_delivery_mobx/screens/checkout.dart';
import 'package:app_delivery_mobx/store/carrinho_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final carrinhoStore = Provider.of<CarrinhoStore>(context);

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SearchInput(searchTextController: searchTextController),
            ),
            const SliverToBoxAdapter(
              child: CategoriaText(titulo: "Mais comprados"),
            ),
            const SliverToBoxAdapter(
              child: ItemList(categoria: "mais comprados"),
            ),
            const SliverToBoxAdapter(
                child: CategoriaText(titulo: "Para o almoço")),
            const SliverToBoxAdapter(
              child: ItemList(categoria: "para o almoço"),
            ),
            const SliverToBoxAdapter(
                child: CategoriaText(titulo: "Para dividir")),
            const SliverToBoxAdapter(
              child: ItemList(categoria: "para dividir"),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Observer(
                  builder: (_) => !carrinhoStore.listaVazia
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>  Checkout(homeContext: context,)));
                          },
                          child: Ink(
                            width: double.infinity,
                            height: 80,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surfaceTint,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Text(
                                          carrinhoStore.quantidadeCarrinho
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                        ),
                                      ),
                                      Icon(
                                        Icons.shopping_bag_outlined,
                                        size: 24,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Ver carrinho",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.shopping_cart_outlined,
                                          size: 24,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      ],
                                    )),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "R\$ ${carrinhoStore.totalCompra.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
