import 'package:flutter/material.dart';
import 'package:weather_app/src/common/constants/constants.dart';
import 'package:weather_app/src/common/router/app_router.dart';
import 'package:weather_app/src/common/service/data_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required this.name, required this.temp});

  final String name;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: ColoredBox(
        color: const Color(0xff353535).withOpacity(0.9),
        child: ListView(
          children: [
            ColoredBox(
              color: Colors.black.withOpacity(0.5),
              child: SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Colors.white,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "$temp°",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 70,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const Divider(),
            for (var i in Constants.names.entries)
              if(i.key != name)
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.white,
                        strokeAlign: 1,
                      )),
                  onTap: () {
                    DataService.getData(i.value);
                    AppRouter.getHome(context, i.key);
                  },
                  title: Text(
                    i.key,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
