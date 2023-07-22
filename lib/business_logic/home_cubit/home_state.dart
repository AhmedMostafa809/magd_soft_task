part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class GetProductSuccessState extends HomeState {}
class GetProductLoadingState extends HomeState {}
