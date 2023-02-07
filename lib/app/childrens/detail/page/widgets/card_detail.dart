part of '../detail_page.dart';

class CardDetailPokemon extends StatelessWidget {
  final PokemonModel pokemon;
  const CardDetailPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              pokemon.name.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          CardTypes(
            pokemon: pokemon,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 10.0),
          Text(
            pokemon.description,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(height: 10.0),
          TextRich(
            identifier: 'ID: ',
            value: pokemon.id.toString(),
          ),
          const SizedBox(height: 10.0),
          TextRich(
            identifier: 'Altura: ',
            value: pokemon.height.toString(),
          ),
          const SizedBox(height: 10.0),
          TextRich(
            identifier: 'Peso: ',
            value: pokemon.weight.toString(),
          ),
        ],
      ),
    );
  }
}

class TextRich extends StatelessWidget {
  final String identifier;
  final String value;
  const TextRich({
    super.key,
    required this.identifier,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: identifier,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
