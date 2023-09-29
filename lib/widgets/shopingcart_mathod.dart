import 'package:flutter_json_local_practice/model/comentModel.dart';

class ShoppingCart {
  static List<Productmodel> products = [];

  static void addProduct({required Productmodel product}) {
    products.add(product);
  }

  static void removeProduct(Productmodel product) {
    products.remove(product);
  }

  static void updateProductQuantity(Productmodel product, int quantity) {
    product.quantity = quantity;
  }

  static double calculateTotal() {
    return products.fold(
        0, (total, product) => total + (product.price! * product.quantity!));
  }
}
