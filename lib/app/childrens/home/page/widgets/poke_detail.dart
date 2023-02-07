import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/app/childrens/home/bloc/poke_detail/poke_detail_bloc.dart';
import 'package:pokemon/app/childrens/home/page/home.dart';

class PokeDetail extends StatefulWidget {
  const PokeDetail({super.key, required this.name});
  final String name;

  @override
  State<PokeDetail> createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    BlocProvider.of<PokeDetailBloc>(context)
        .add(PokeDetailStarted(name: widget.name));
    return const PokeCard();
  }

  @override
  bool get wantKeepAlive => true;
}
