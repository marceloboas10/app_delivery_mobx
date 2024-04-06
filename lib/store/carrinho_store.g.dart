// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarrinhoStore on _CarrinhoStore, Store {
  Computed<int>? _$quantidadeCarrinhoComputed;

  @override
  int get quantidadeCarrinho => (_$quantidadeCarrinhoComputed ??= Computed<int>(
          () => super.quantidadeCarrinho,
          name: '_CarrinhoStore.quantidadeCarrinho'))
      .value;

  late final _$listaCarrinhoAtom =
      Atom(name: '_CarrinhoStore.listaCarrinho', context: context);

  @override
  List<Item> get listaCarrinho {
    _$listaCarrinhoAtom.reportRead();
    return super.listaCarrinho;
  }

  @override
  set listaCarrinho(List<Item> value) {
    _$listaCarrinhoAtom.reportWrite(value, super.listaCarrinho, () {
      super.listaCarrinho = value;
    });
  }

  late final _$_CarrinhoStoreActionController =
      ActionController(name: '_CarrinhoStore', context: context);

  @override
  void addCarinho(Item item) {
    final _$actionInfo = _$_CarrinhoStoreActionController.startAction(
        name: '_CarrinhoStore.addCarinho');
    try {
      return super.addCarinho(item);
    } finally {
      _$_CarrinhoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCarrinho(Item item) {
    final _$actionInfo = _$_CarrinhoStoreActionController.startAction(
        name: '_CarrinhoStore.removeCarrinho');
    try {
      return super.removeCarrinho(item);
    } finally {
      _$_CarrinhoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaCarrinho: ${listaCarrinho},
quantidadeCarrinho: ${quantidadeCarrinho}
    ''';
  }
}
