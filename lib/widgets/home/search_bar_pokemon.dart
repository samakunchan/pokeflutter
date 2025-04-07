import 'package:flutter/material.dart';
import 'package:pokeflutter/utils/themes.dart';

class SearchBarPokemon extends StatelessWidget {
  const SearchBarPokemon({this.onChanged, super.key});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: appDecoration(radius: 30),
        child: TextField(
          // focusNode: FocusNode(),
          // autofocus: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
