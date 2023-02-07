import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/childrens/detail/bloc/poke_description_bloc.dart';
import 'package:pokemon/app/childrens/detail/page/detail_page.dart';
import 'package:pokemon/app/childrens/home/bloc/poke_detail/poke_detail_bloc.dart';
import 'package:pokemon/app/childrens/home/bloc/pokemon_bloc.dart';
import 'package:pokemon/app/childrens/home/page/home.dart';
import 'package:dio/dio.dart';
import 'package:pokemon/app/childrens/home/repository/pokemon_repository.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind<Dio>(
        (i) => Dio(),
      ),
      Bind<PokemonRepository>(
        (i) => PokemonRepository(
          i<Dio>(),
        ),
      ),
      Bind<PokemonBloc>(
        (i) => PokemonBloc(
          i<PokemonRepository>(),
        ),
      ),
      Bind<PokeDetailBloc>(
        (i) => PokeDetailBloc(
          i<PokemonRepository>(),
        ),
        isSingleton: false,
      ),
      Bind<PokeDescriptionBloc>(
        (i) => PokeDescriptionBloc(
          i<PokemonRepository>(),
        ),
      ),
    ];
  }

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: ((context, args) => const HomePage()),
        ),
        ChildRoute(
          '/detail',
          child: ((context, args) => DetailPage(pokemon: args.data)),
        ),
      ];
}
