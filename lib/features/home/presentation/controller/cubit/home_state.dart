part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  final int offset;
  final List<Character> verticalCharacters;
  final List<Character> horizontalCharacters;

  HomeState(
      {this.offset = 0,
      this.verticalCharacters = const [],
      this.horizontalCharacters = const []});

  @override
  List<Object?> get props => [offset, verticalCharacters, horizontalCharacters];
}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeMoreHeroesLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  HomeLoaded(
      {super.verticalCharacters, super.horizontalCharacters});

  @override
  List<Object?> get props =>
      [verticalCharacters, horizontalCharacters];
}
