import 'package:flutter/material.dart';

import '../utils/constants.dart';

class InputWidget extends StatelessWidget {
  final Function(String) onSaved;

  final dynamic Function(String) validator;
  TextInputType? keyboardType;
  final String hintText;
  bool? obscure;
  InputWidget({
    super.key,
    required this.onSaved,
    this.keyboardType,
    required this.hintText,
    required this.validator,
    this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          //color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: mainredBlacked,
          ),
        ),
        child: TextFormField(
          onSaved: (value) {
            onSaved(value!);
          },
          keyboardType: keyboardType ?? TextInputType.name,
          obscureText: obscure ?? false,
          validator: (value) {
            return validator(value!);
          },
          style: const TextStyle(color: mainRed),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: mainRed,
            ),
          ),
        ),
      ),
    );
  }
}
