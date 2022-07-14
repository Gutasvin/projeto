import 'package:flutter/material.dart';
import 'package:projeto_merc/components/app_drawer.dart';
import 'package:projeto_merc/components/order_widget.dart';
import 'package:projeto_merc/models/order_list.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.builder(
        itemCount: orderList.itemsCounts,
        itemBuilder: (context, index) =>
            OrderWidget(order: orderList.items[index]),
      ),
      drawer: AppDrawer(),
    );
  }
}
