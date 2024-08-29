import 'dart:convert';

import 'package:weather_app/src/common/model/weather_model.dart';

abstract interface class IHomeRepository {
  const IHomeRepository();
}

class HomeRepositoryImpl implements IHomeRepository {
  static List<Model> getModel(String data) {
    try {
      print("$data Json");
      final Map<String, Object?> json = jsonDecode(data);
      return [Model.fromJson(json)];
    } on Object catch (e, s) {
      print("$e,\n$s");
      return [];
    }
  }
}
