import 'package:flutter/material.dart';
import 'package:mobile_shop/utils/constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 250,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        textAlign: TextAlign.start,
        showCursor: true,
        cursorColor: mainRed,
        style: TextStyle(
          color: mainRed,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
