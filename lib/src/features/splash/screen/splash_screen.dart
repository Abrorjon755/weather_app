import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/src/common/constants/constants.dart';
import 'package:weather_app/src/common/router/app_router.dart';
import 'package:weather_app/src/common/service/api_server.dart';
import 'package:weather_app/src/common/service/data_service.dart';
import 'package:weather_app/src/common/style/app_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigateToHome(BuildContext context) async {
    final connection = await apiService.checkConnection();
    if (!connection && context.mounted) {
      Navigator.pushReplacementNamed(context, AppRouter.connection);
    }
    String? region = shp.getString("region");
    if (region == null || region == "") {
      region = Constants.kokandName;
    }
    final result = await DataService.getData(region);
    if (result && context.mounted) {
      AppRouter.getHome(context, region);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => navigateToHome(context),
    );
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
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      width: 200,
                      image: AssetImage(AppIcons.splash),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "Weather",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      "App",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "abrorjon755.dev",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: const Color(0xff535353).withOpacity(0.8),
                          ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
