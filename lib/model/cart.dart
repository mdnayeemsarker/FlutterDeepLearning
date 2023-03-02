import 'package:flutter_dl/model/product.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  // Products field
  late ProductsModel _product;

  // Collections of Ids
  final List<int> _itemIds = [];

  ProductsModel get product => _product;

  set product(ProductsModel newProduct) {
    assert(newProduct != null);
    _product = newProduct;
  }

  List<Item> get items => _itemIds.map((id) => _product.getById(id)).toList();

  // total price of cart.
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add item in cart
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // remove item in cart
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
