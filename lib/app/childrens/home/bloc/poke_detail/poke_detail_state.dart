part of 'poke_detail_bloc.dart';

abstract class PokeDetailState extends Equatable {
  const PokeDetailState();

  @override
  List<Object> get props => [];
}

class PokeDetailInitial extends PokeDetailState {}

class PokeDetailLoading extends PokeDetailState {}

class PokeDetailLoad extends PokeDetailState {
  final PokemonModel pokemon;

  const PokeDetailLoad(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}

class PokeDetailFailure extends PokeDetailState {}
