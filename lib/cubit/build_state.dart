part of 'build_cubit.dart';

@immutable
abstract class BuildState {}

class BuildInitial extends BuildState {}

class BuiltColumns extends BuildState {
  final List<DataColumn> columns;
  BuiltColumns(this.columns) : super();
}
