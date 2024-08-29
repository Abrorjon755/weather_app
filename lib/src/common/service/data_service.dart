import 'package:weather_app/main.dart';
import 'package:weather_app/src/common/constants/constants.dart';
import 'package:weather_app/src/common/model/weather_model.dart';
import 'package:weather_app/src/common/service/api_server.dart';
import 'package:weather_app/src/features/home/data/home_repository.dart';

class DataService {
  static List<Model> data = [];

  static Future<bool> getData(String region) async {
    final response = await apiService.get(region);
    final result = HomeRepositoryImpl.getModel(response);
    String name = '';
    for (var e in Constants.names.entries) {
      if (e.value == region) name = e.key;
    }
    await shp.setString("region", name);
    data = [];
    data = result;
    return true;
  }
}
