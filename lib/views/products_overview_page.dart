import 'package:flutter/material.dart';
import 'package:projeto_merc/components/product_grid.dart';

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
        ],
      ),
      body: ProductGrid(_showFavoritesOnly),
    );
  }
}
