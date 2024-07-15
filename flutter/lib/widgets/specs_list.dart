import 'dart:math';

import 'package:flutter/material.dart';

class SpecsList extends StatelessWidget {
  //final Map<String, dynamic> specs;
  final List<MapEntry<String, dynamic>> specEntries;
  const SpecsList({
    super.key,
    required this.specEntries,
  });
  @override
  Widget build(BuildContext context) {
    //List specEntries = specs.entries.toList();
    //print(specEntries.runtimeType);
    //List<MapEntry<String, dynamic>> spe = specEntries;
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: specEntries.length,
        itemBuilder: (context, index) {
          int longer = max(
              specEntries[index].key.length, specEntries[index].value.length);

          //var numLetters = longer;
          var currentWidth = (longer / 2) * 24.0;
          if (longer <= 5) {
            currentWidth += 15;
          }
          return SizedBox(
            height: 100,
            width: currentWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        specEntries[index].value,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
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
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
