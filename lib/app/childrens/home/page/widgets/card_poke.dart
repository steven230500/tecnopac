part of '../home.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokeDetailBloc, PokeDetailState>(
      builder: (context, state) {
        if (state is PokeDetailLoading || state is PokeDetailInitial) {
          return const SizedBox(
            width: 5,
            height: 5,
            child: CircularProgressIndicator(),
          );
        }
        if (state is PokeDetailLoad) {
          return InkWell(
            onTap: () {
              Modular.to.pushNamed('/detail', arguments: state.pokemon);
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    state.pokemon.sprites.frontDefault,
                    scale: 0.5,
                  ),
                  Text(
                    state.pokemon.order.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    state.pokemon.name.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  CardTypes(pokemon: state.pokemon),
                ],
              ),
            ),
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
    );
  }
}
