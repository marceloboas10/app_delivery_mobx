import 'package:app_delivery_mobx/models/item.dart';
import 'package:mobx/mobx.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaCarrinho = ObservableList<Item>();

  @observable
  double totalCompra = 0;

  @computed
  int get quantidadeCarrinho => listaCarrinho.length;

  @computed
  bool get listaVazia => listaCarrinho.isEmpty;

  @action
  void addCarinho(Item item) {
    listaCarrinho.add(item);
    atualizaTotalCompra();
  }

  @action
  void removeCarrinho(Item item) {
    listaCarrinho.remove(item);
    atualizaTotalCompra();
  }

  @action
  void atualizaTotalCompra() {
    totalCompra = 0;

    for (var i = 0; i < listaCarrinho.length; i++) {
      totalCompra += listaCarrinho[i].preco;
    }
  }
}
