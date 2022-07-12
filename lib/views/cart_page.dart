import 'package:flutter/material.dart';
import 'package:projeto_merc/components/cart_item_widget.dart';
import 'package:projeto_merc/models/cart.dart';
import 'package:projeto_merc/models/product_list_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final product = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(children: [
        Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    )),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: const Text('Finalizar Pedido'))
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: ((context, index) {
                  final cartItem = cart.items.values.toList()[index];
                  return CartItemWidget(
                    cartItem: cartItem,
                  );
                })))
      ]),
    );
  }
}
