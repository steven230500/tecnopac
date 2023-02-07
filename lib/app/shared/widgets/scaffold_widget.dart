import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget child;

  const ScaffoldWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return _View(child: child);
  }
}

class _View extends StatelessWidget {
  const _View({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Pokedex'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: child,
      ),
    );
  }
}
