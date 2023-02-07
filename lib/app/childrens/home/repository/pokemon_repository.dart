import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokemon/app/childrens/home/models/pokemon_model.dart';

import 'package:pokemon/app/childrens/home/models/pokemon_response.dart';
import 'package:pokemon/app/shared/errors/exceptions.dart';
import 'package:pokemon/app/shared/errors/failures.dart';

class PokemonRepository {
  PokemonRepository(this.dio);

  final Dio dio;

  Future<Either<Failure, List<PokemonResponse>>> getPokemons() async {
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon',
      );

      List<PokemonResponse> result = [];
      for (var element in response.data['results']) {
        result.add(PokemonResponse.fromJson(element));
      }
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<PokemonResponse>>> getPokemonsByWord(
      String word) async {
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon/$word',
      );

      List<PokemonResponse> result = [];
      result.add(
        PokemonResponse(
          name: response.data['name'],
          url: 'https://pokeapi.co/api/v2/pokemon/$word',
        ),
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, PokemonModel>> getPokemonByUrl(String name) async {
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon/$name',
      );
      return Right(
        PokemonModel.fromJson(response.data),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, String>> getPokemonDescription(
    PokemonModel pokemon,
  ) async {
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon-species/${pokemon.id}',
      );

      final List<dynamic> flavorText = response.data['flavor_text_entries'];

      return Right(flavorText[0]['flavor_text']);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
