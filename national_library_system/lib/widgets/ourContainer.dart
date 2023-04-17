import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:national_library_system/utils/ourTheme.dart';

class OurContainer extends StatelessWidget {
  final Widget child;

  const OurContainer(
      {super.key,
      required this.child,
      this.size = 20.0,
      this.blurRadius = 10.0});
  final double size;
  final double blurRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: blurRadius,
              spreadRadius: 0.1,
              offset: Offset(4.0, 4.0)),
        ],
      ),
      child: child,
    );
  }
}
