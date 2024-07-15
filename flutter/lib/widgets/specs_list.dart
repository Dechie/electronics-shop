import 'package:flutter/material.dart';

class SpecsList extends StatelessWidget {
  final Map<String, dynamic> specs;
  const SpecsList({
    super.key,
    required this.specs,
  });
  @override
  Widget build(BuildContext context) {
    List specEntries = specs.entries.toList();
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: specs.entries.length,
        itemBuilder: (context, index) => SizedBox(
          height: 50,
          width: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(specEntries[index].value),
                const SizedBox(height: 10),
                Text(
                  specEntries[index].key,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
