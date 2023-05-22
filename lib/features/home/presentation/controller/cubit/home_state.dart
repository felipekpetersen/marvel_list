part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  final int offset;
  final List<Character> characters;

  HomeState({this.offset = 0, this.characters = const []});
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  // final List<Character> characters;

  HomeLoaded({super.characters});
}
