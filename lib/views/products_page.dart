import 'package:flutter/material.dart';
import 'package:projeto_merc/components/app_drawer.dart';
import 'package:projeto_merc/components/product_item.dart';
import 'package:projeto_merc/models/product_list_provider.dart';
import 'package:projeto_merc/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.itemsCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              ProductItem(products.items[i]),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
