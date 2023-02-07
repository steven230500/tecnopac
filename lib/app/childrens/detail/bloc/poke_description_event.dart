part of 'poke_description_bloc.dart';

abstract class PokeDescriptionEvent extends Equatable {
  const PokeDescriptionEvent();

  @override
  List<Object> get props => [];
}

class PokeDescriptionStarted extends PokeDescriptionEvent {
  const PokeDescriptionStarted({
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  List<Object> get props => [pokemon];
}
