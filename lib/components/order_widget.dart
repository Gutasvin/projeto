import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_merc/models/oder.dart';

class OrderWidget extends StatefulWidget {
  final Order order;
  const OrderWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.order.id),
            leading: CircleAvatar(
                child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('${widget.order.amount}'),
              ),
            )),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
                icon: Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                }),
          ),
          if (_isExpanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: widget.order.products.length * 25.0 + 10,
              child: ListView(
                  children: widget.order.products.map((e) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${e.quantity}x  R\$ ${e.price}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              }).toList()),
            ),
        ],
      ),
    );
  }
}
