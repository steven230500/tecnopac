part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class PokemonEventStared extends PokemonEvent {}

class PokemonEventSearched extends PokemonEvent {
  final String word;
  const PokemonEventSearched(this.word);

  @override
  List<Object> get props => [word];
}
