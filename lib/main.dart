import 'package:app_delivery_mobx/screens/home.dart';
import 'package:app_delivery_mobx/store/carrinho_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Delivery());
}

class Delivery extends StatelessWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Mobx',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 83, 83),
        ),
        useMaterial3: true,
      ),
      home: Provider(
        create: (_) => CarrinhoStore(),
        child: Home(),
      ),
    );
  }
}
