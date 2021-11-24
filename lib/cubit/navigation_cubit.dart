import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:sap_wiki/models/navigation_model.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  Future<List<NavigationModel>> _getTitle() async {
    final String res = await rootBundle.loadString('assets/navigation.json');
    final jsonData = jsonDecode(res) as List;

    List<NavigationModel> list =
        jsonData.map((e) => NavigationModel.fromJson(e)).toList();
    return list;
  }

  void init() async {
    try {
      var articles = await _getTitle();
      emit(NavigationSuccess(articles));
    } catch (e) {
      emit(
        NavigationError('Fehler $e'),
      );
    }
  }
}
