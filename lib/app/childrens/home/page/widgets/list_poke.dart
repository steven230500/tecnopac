part of '../home.dart';

class ListPoke extends StatelessWidget {
  const ListPoke({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PokemonLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                crossAxisSpacing: 15.0,
              ),
              itemCount: state.pokemonResponse.length,
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              itemBuilder: (BuildContext context, int index) {
                return BlocProvider.value(
                  value: Modular.get<PokeDetailBloc>(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: PokeDetail(
                      name: state.pokemonResponse[index].name,
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text(
              'Not Found',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
