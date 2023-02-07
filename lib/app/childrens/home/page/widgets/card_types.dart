import 'package:flutter/material.dart';
import 'package:pokemon/app/childrens/home/models/pokemon_model.dart';

class CardTypes extends StatelessWidget {
  final PokemonModel pokemon;
  final MainAxisAlignment mainAxisAlignment;
  const CardTypes({
    super.key,
    required this.pokemon,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: pokemon.types
          .map(
            (e) => Container(
              margin: const EdgeInsets.only(right: 10.0, top: 5.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.red,
              ),
              child: Text(
                e.name,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          )
          .toList(),
    );
  }
}
