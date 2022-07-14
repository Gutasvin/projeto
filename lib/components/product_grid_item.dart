import 'package:flutter/material.dart';
import 'package:projeto_merc/models/cart.dart';
import 'package:projeto_merc/models/product.dart';
import 'package:projeto_merc/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
            },
            child: Image.network(product.imageUrl, fit: BoxFit.cover)),
        footer: GridTileBar(
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
          leading: Consumer<Product>(
            builder: (context, product, child) => IconButton(
                onPressed: () {
                  product.toggleFavorite();
                },
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                )),
          ),
          trailing: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Produto adicionado ao carrinho!  '),
                    duration: const Duration(seconds: 3),
                    action: SnackBarAction(
                      label: 'Desfazer',
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      },
                    ),
                  ),
                );
                cart.addItem(product);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.red,
              )),
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }
}
