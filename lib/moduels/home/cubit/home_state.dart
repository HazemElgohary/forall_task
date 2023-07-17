part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeAddProblem extends HomeState {}
class HomeChangeProblemValue extends HomeState {}
