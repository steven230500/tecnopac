import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/app/childrens/home/models/pokemon_response.dart';
import 'package:pokemon/app/childrens/home/repository/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc(this._repository) : super(PokemonInitial()) {
    on<PokemonEventStared>(_onGetPokemon);
    on<PokemonEventSearched>(_onGetPokemonByname);
  }

  final PokemonRepository _repository;

  String? pokeWord;

  void _onGetPokemon(
    PokemonEventStared event,
    Emitter<PokemonState> emit,
  ) async {
    emit(PokemonLoading());

    try {
      final result = await _repository.getPokemons();

      result.fold(
        (l) => emit(PokemonError()),
        (r) => emit(
          PokemonLoaded(r),
        ),
      );
    } catch (e) {
      emit(PokemonError());
    }
  }

  void _onGetPokemonByname(
    PokemonEventSearched event,
    Emitter<PokemonState> emit,
  ) async {
    emit(PokemonLoading());

    try {
      final result = await _repository.getPokemonsByWord(event.word);

      result.fold(
        (l) => emit(PokemonError()),
        (r) => emit(
          PokemonLoaded(r),
        ),
      );
    } catch (e) {
      emit(PokemonError());
    }
  }
}
