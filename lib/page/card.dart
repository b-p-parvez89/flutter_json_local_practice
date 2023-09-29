import 'package:flutter/material.dart';
import 'package:flutter_json_local_practice/widgets/shopingcart_mathod.dart';

class ShopingCard extends StatefulWidget {
  const ShopingCard({super.key});

  @override
  State<ShopingCard> createState() => _ShopingCardState();
}

class _ShopingCardState extends State<ShopingCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: ListView.builder(
                itemCount: ShoppingCart.products.length,
                itemBuilder: (context, index) {
                  final product = ShoppingCart.products[index];
                  return ListTile(
                    title: Text(product.title.toString()),
                    subtitle: Text('Quantity: ${product.quantity}'),
                    trailing: Text(
                        '\$${(product.price! * product.quantity!).toStringAsFixed(2)}'),
                  );
                },
              ),
            )),
            Text(
                'Total: \$${ShoppingCart.calculateTotal().toStringAsFixed(2)}'),
          ],
        ));
  }
}
