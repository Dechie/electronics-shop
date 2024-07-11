import 'package:flutter/material.dart';

class DynamicGrid extends StatefulWidget {
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemcount;
  const DynamicGrid(
      {super.key, required this.itemBuilder, required this.itemcount});

  @override
  State<DynamicGrid> createState() => _DynamicGridState();
}

class _DynamicGridState extends State<DynamicGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: widget.itemBuilder,
      itemCount: widget.itemcount,
    );
  }
}
