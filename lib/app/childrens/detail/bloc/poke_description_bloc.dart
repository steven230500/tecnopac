import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/app/childrens/home/models/pokemon_model.dart';
import 'package:pokemon/app/childrens/home/repository/pokemon_repository.dart';

part 'poke_description_event.dart';
part 'poke_description_state.dart';

class PokeDescriptionBloc
    extends Bloc<PokeDescriptionEvent, PokeDescriptionState> {
  PokeDescriptionBloc(this._repository) : super(PokeDescriptionInitial()) {
    on<PokeDescriptionStarted>(_onGetPokemonDescription);
  }
  final PokemonRepository _repository;

  void _onGetPokemonDescription(
    PokeDescriptionStarted event,
    Emitter<PokeDescriptionState> emit,
  ) async {
    emit(PokeDescriptionInitial());

    try {
      final result = await _repository.getPokemonDescription(event.pokemon);
      emit(PokeDescriptionLoading());

      result.fold(
        (l) => emit(PokeDescriptionFailure()),
        (r) {
          emit(
            PokeDescriptionLoad(
              event.pokemon.copyWith(description: r.replaceAll('\n', ' ')),
            ),
          );
        },
      );
    } catch (e) {
      emit(PokeDescriptionFailure());
    }
  }
}
