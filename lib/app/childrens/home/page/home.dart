import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/childrens/home/bloc/poke_detail/poke_detail_bloc.dart';
import 'package:pokemon/app/childrens/home/bloc/pokemon_bloc.dart';
import 'package:pokemon/app/childrens/home/page/widgets/card_types.dart';
import 'package:pokemon/app/childrens/home/page/widgets/poke_detail.dart';
import 'package:pokemon/app/shared/widgets/scaffold_widget.dart';

part 'widgets/search_widget.dart';
part 'widgets/list_poke.dart';
part 'widgets/card_poke.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonBloc>(
      create: (context) => Modular.get<PokemonBloc>()
        ..add(
          PokemonEventStared(),
        ),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Pokemones',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SearchPockeWidget(),
          ListPoke(),
        ],
      ),
    );
  }
}
