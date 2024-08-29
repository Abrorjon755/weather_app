import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/src/common/constants/constants.dart';
import 'package:weather_app/src/common/router/app_router.dart';
import 'package:weather_app/src/common/service/api_server.dart';
import 'package:weather_app/src/common/service/data_service.dart';

class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({super.key});

  void refresh(BuildContext context) async {
    if (await apiService.checkConnection()) {
      String? region = shp.getString("region");
      if (region == null || region == "") {
        region = Constants.kokandName;
      }
      final result = await DataService.getData(region);
      if (result && context.mounted) {
        AppRouter.getHome(context, region);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff54538b),
              Colors.white,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: ColoredBox(
          color: Colors.black.withOpacity(0.3),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No Connection",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 30),
                IconButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () => refresh(context),
                  icon: const Icon(
                    Icons.refresh,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
