part of 'poke_description_bloc.dart';

abstract class PokeDescriptionState extends Equatable {
  const PokeDescriptionState();

  @override
  List<Object> get props => [];
}

class PokeDescriptionInitial extends PokeDescriptionState {}

class PokeDescriptionLoading extends PokeDescriptionState {}

class PokeDescriptionLoad extends PokeDescriptionState {
  final PokemonModel pokemon;

  const PokeDescriptionLoad(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}

class PokeDescriptionFailure extends PokeDescriptionState {}
