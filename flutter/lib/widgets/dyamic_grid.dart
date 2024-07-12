import 'package:flutter/material.dart';

class DynamicGrid extends StatefulWidget {
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemcount;
  final Map<String, int> aspRatio;

  const DynamicGrid({
    super.key,
    required this.itemBuilder,
    required this.itemcount,
    required this.aspRatio,
  });

  @override
  State<DynamicGrid> createState() => _DynamicGridState();
}

class _DynamicGridState extends State<DynamicGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio: 1 / 4,
        childAspectRatio: widget.aspRatio['width']! /
            (widget.aspRatio['height']! / 1.65).round(),
        mainAxisSpacing: 30,
        crossAxisSpacing: 10,
      ),
      itemBuilder: widget.itemBuilder,
      itemCount: widget.itemcount,
    );
  }
}
