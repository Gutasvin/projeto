import 'package:flutter/material.dart';
import 'package:projeto_merc/models/product.dart';
import 'package:projeto_merc/models/product_list_provider.dart';
import 'package:projeto_merc/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                  arguments: product,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Produto'),
                    content: const Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                      ),
                      Consumer<ProductList>(
                        builder: ((_, value, __) => TextButton(
                              child: const Text('Sim'),
                              onPressed: () {
                                value.removeProduct(product);
                                Navigator.of(ctx).pop();
                              },
                            )),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
