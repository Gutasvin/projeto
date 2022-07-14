import 'package:flutter/material.dart';
import 'package:projeto_merc/models/cart.dart';
import 'package:projeto_merc/models/order_list.dart';
import 'package:projeto_merc/models/product_list_provider.dart';
import 'package:projeto_merc/utils/app_routes.dart';
import 'package:projeto_merc/views/cart_page.dart';
import 'package:projeto_merc/views/orders_page.dart';
import 'package:projeto_merc/views/product_detail_page.dart';
import 'package:projeto_merc/views/product_form_page.dart';
import 'package:projeto_merc/views/products_page.dart';
import 'package:projeto_merc/views/products_overview_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Minha Loja',
        theme: ThemeData(
          fontFamily: 'Lato',
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (context) => ProdutctsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (context) => const ProductDetailPage(),
          AppRoutes.CART: (context) => const CartPage(),
          AppRoutes.ORDERS: (context) => const OrdersPage(),
          AppRoutes.PRODUCTS: (context) => const ProductsPage(),
          AppRoutes.PRODUCT_FORM: (context) => const ProductFormPage(),
        },
        // home: ProdutctsOverviewPage(),
      ),
    );
  }
}
