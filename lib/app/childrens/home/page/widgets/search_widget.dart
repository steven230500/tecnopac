part of '../home.dart';

class SearchPockeWidget extends StatelessWidget {
  const SearchPockeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: 'Busca un pokemon',
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (String? value) {
              Modular.get<PokemonBloc>().pokeWord = value;
            },
          ),
        ),
        const SizedBox(width: 15),
        TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 20.0,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          onPressed: () {
            final pokeWorkd = Modular.get<PokemonBloc>().pokeWord;
            if (pokeWorkd == '') {
              Modular.get<PokemonBloc>().add(
                PokemonEventStared(),
              );
            } else {
              Modular.get<PokemonBloc>().add(
                PokemonEventSearched(
                  Modular.get<PokemonBloc>().pokeWord ?? '',
                ),
              );
            }
          },
          child: const Text(
            'BUSCAR',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        )
      ],
    );
  }
}
