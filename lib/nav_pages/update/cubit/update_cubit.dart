import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:sap_wiki/nav_pages/update/update_model.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInitial());

  Future<List<UpdateModel>> _getUpdate() async {
    final String res = await rootBundle.loadString('assets/update.json');
    final data = json.decode(res) as List;

    List<UpdateModel> list = data.map((e) => UpdateModel.fromJson(e)).toList();
    return list;
  }

  void init() async {
    try {
      var update = await _getUpdate();
      emit(UpdateSuccess(update));
    } catch (e) {
      emit(
        UpdateError('Fehler $e'),
      );
    }
  }
}
