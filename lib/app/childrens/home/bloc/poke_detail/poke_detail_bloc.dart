import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/app/childrens/home/models/pokemon_model.dart';
import 'package:pokemon/app/childrens/home/repository/pokemon_repository.dart';

part 'poke_detail_event.dart';
part 'poke_detail_state.dart';

class PokeDetailBloc extends Bloc<PokeDetailEvent, PokeDetailState> {
  PokeDetailBloc(this._repository) : super(PokeDetailInitial()) {
    on<PokeDetailStarted>(_onGetPokemonByUrl);
  }
  final PokemonRepository _repository;

  void _onGetPokemonByUrl(
    PokeDetailStarted event,
    Emitter<PokeDetailState> emit,
  ) async {
    emit(PokeDetailInitial());

    try {
      final result = await _repository.getPokemonByUrl(event.name);
      emit(PokeDetailLoading());

      result.fold(
        (l) => emit(PokeDetailFailure()),
        (r) async {
          emit(
            PokeDetailLoad(r),
          );
        },
      );
    } catch (e) {
      emit(PokeDetailFailure());
    }
  }
}
