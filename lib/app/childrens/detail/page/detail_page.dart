import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/childrens/detail/bloc/poke_description_bloc.dart';
import 'package:pokemon/app/childrens/home/models/pokemon_model.dart';
import 'package:pokemon/app/childrens/home/page/widgets/card_types.dart';
import 'package:pokemon/app/shared/widgets/scaffold_widget.dart';

part 'widgets/card_detail.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<PokeDescriptionBloc>()
        ..add(PokeDescriptionStarted(pokemon: pokemon)),
      child: _View(pokemon: pokemon),
    );
  }
}

class _View extends StatelessWidget {
  const _View({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      child: BlocBuilder<PokeDescriptionBloc, PokeDescriptionState>(
        builder: (context, state) {
          if (state is PokeDescriptionInitial ||
              state is PokeDescriptionLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PokeDescriptionLoad) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Modular.to.popUntil((_) => false),
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      state.pokemon.sprites.frontDefault,
                      scale: 0.4,
                    ),
                  ),
                  CardDetailPokemon(pokemon: state.pokemon)
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
