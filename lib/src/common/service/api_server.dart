import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather_app/src/common/constants/constants.dart';
import 'package:http/http.dart' as http;

const apiService = ApiService();

class ApiService {
  const ApiService();

  Future<bool> checkConnection() async {
    final connection = await Connectivity().checkConnectivity();
    return connection.contains(ConnectivityResult.mobile) ||
        connection.contains(ConnectivityResult.wifi);
  }

  Future<String> get(String region) async {
    try {
      final url = Uri.parse("${Constants.baseUrl}$region");
      final response = await http.get(url);
      return response.statusCode == 200 ? response.body : "";
    } on Object catch (e, s) {
      print("$e\n$s");
      return "";
    }
  }
}
