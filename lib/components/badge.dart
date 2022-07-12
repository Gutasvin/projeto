import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;
  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(value,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 10)),
            ),
            right: 8,
            top: 8)
      ],
    );
  }
}
