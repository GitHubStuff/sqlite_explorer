import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'build_state.dart';

class BuildCubit extends Cubit<BuildState> {
  BuildCubit() : super(BuildInitial());

  void dataReady(List<DataColumn> dataColumns) => emit(BuiltColumns(dataColumns));
}
