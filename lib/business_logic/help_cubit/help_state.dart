part of 'help_cubit.dart';

@immutable
abstract class HelpState {}

class HelpInitial extends HelpState {}

class HelpLoaded extends HelpState {
  final List<HelpModel> help;
  HelpLoaded(this.help);
}