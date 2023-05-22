import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit get _homeCubit =>
      BlocProvider.of<HomeCubit>(context);

  @override
  Widget build(BuildContext context) {
    _homeCubit.getCharacters();

    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      else if (state is HomeLoaded) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Marvel List'),
          ),
          body: ListView.builder(
            itemCount: state.characters.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.characters[index].name ?? ''),
              );
            },
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text('Marvel List'),
        ),
        body: Container(),
      );
    });
  }
}
