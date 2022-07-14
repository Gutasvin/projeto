import 'package:flutter/material.dart';
import 'package:projeto_merc/components/app_drawer.dart';
import 'package:projeto_merc/components/badge.dart';
import 'package:projeto_merc/components/product_grid.dart';
import 'package:projeto_merc/models/cart.dart';
import 'package:projeto_merc/utils/app_routes.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProdutctsOverviewPage extends StatefulWidget {
  ProdutctsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProdutctsOverviewPage> createState() => _ProdutctsOverviewPageState();
}

class _ProdutctsOverviewPageState extends State<ProdutctsOverviewPage> {
  bool _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showFavoritesOnly = true;
                  } else {
                    _showFavoritesOnly = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => const [
                    PopupMenuItem(
                      child: Text('Somente Favoritos'),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Todos'),
                      value: FilterOptions.All,
                    ),
                  ]),
          Consumer<Cart>(
              builder: ((context, value, child) => Badge(
                  value: value.itemsCount.toString(),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.CART);
                      },
                      icon: const Icon(Icons.shopping_cart)))))
        ],
      ),
      body: ProductGrid(_showFavoritesOnly),
      drawer: AppDrawer(),
    );
  }
}
