part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  final int offset;
  final List<Character> verticalCharacters;
  final List<Character> horizontalCharacters;

  HomeState({this.offset = 0, this.verticalCharacters = const [], this.horizontalCharacters = const []});
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeMoreHeroesLoading extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded({super.verticalCharacters, super.horizontalCharacters});
}
