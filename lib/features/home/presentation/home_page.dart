import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit get _homeCubit => BlocProvider.of<HomeCubit>(context);
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _homeCubit.getCharacters();

    _scrollController.addListener(() {
      var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        _homeCubit.getMoreCharacters();
      }
    });

    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is HomeLoaded) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Marvel List'),
          ),
          body: ListView.builder(
            controller: _scrollController,
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
