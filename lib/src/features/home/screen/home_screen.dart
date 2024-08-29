import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/common/constants/constants.dart';
import 'package:weather_app/src/common/model/weather_model.dart';
import 'package:weather_app/src/common/service/data_service.dart';
import 'package:weather_app/src/features/home/data/weather_name.dart';
import 'package:weather_app/src/features/home/screen/my_decorated_box.dart';
import 'package:weather_app/src/features/home/screen/my_drawer.dart';
import 'package:weather_app/src/features/home/screen/my_hours.dart';
import 'package:weather_app/src/features/home/screen/shimmer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.name});

  final String name;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController();
  bool isLoading = true;
  Model? data;

  Future<void> getData() async {
    isLoading = true;
    setState(() {});
    await DataService.getData(Constants.names[widget.name] ?? Constants.kokandName);
    data = DataService.data.first;
    isLoading = false;
    setState(() {});
  }

  String iconCheck(int i) {
    return ((i >= 19 && i < 24) || (i - 24 <= 5 && i - 24 >= 0)) &&
            [0, 1, 2, 51, 53].contains(data?.hourlyCode[i])
        ? "assets/icons/${data?.hourlyCode[i]}_${data?.hourlyCode[i]}.png"
        : "assets/icons/${data?.hourlyCode[i]}.png";
  }

  String iconCheck2(int i) {
    int time = DateTime.now().hour;
    return ((time >= 19 && time < 24) || (time <= 5 && time >= 0)) &&
            ![0, 1, 2, 51, 53].contains(i)
        ? "assets/icons/${i}_$i.png"
        : "assets/icons/$i.png";
  }

  String night(int i) {
    return [0, 1, 2, 51, 53].contains(i)
        ? "assets/icons/${i}_$i.png"
        : "assets/icons/$i.png";
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/icons/images/${widget.name.toLowerCase()}.jpg"),
          ),
        ),
        child: ColoredBox(
          color: Colors.black.withOpacity(0.3),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            endDrawer: MyDrawer(
              name: widget.name,
              temp: "${data?.currentTemp.round()}",
            ),
            appBar: AppBar(
              toolbarHeight: 90,
              backgroundColor: Colors.transparent,
              scrolledUnderElevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 31,
              ),
              title: Row(
                children: [
                  const Icon(Icons.place),
                  const SizedBox(width: 5),
                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              actions: const [
                EndDrawerButton(),
                SizedBox(width: 10),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: getData,
              child: isLoading
                  ? const ShimmerScreen()
                  : ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          "${DateFormat("MMMM").format(DateTime.now())} ${"${DateTime.now().day}".padLeft(2, "0")}",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Updated ${DateFormat("MM/dd/yyyy H:mm").format(DateTime.now())}",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: Image(
                            width: 80,
                            image:
                                AssetImage(iconCheck2(data?.currentCode ?? 0)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          Weather.name(data?.currentCode ?? 0),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        Center(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                data?.currentTemp.round().toString() ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontSize: 86,
                                    ),
                              ),
                              Positioned(
                                top: 10,
                                right: -25,
                                child: Text(
                                  "°C",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        MyDecoratedBox(
                          child: SizedBox(
                            height: 110,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              controller: ScrollController(
                                  initialScrollOffset:
                                      88 * DateTime.now().hour.toDouble()),
                              children: [
                                for (int i = 0;
                                    i < DateTime.now().hour + 23;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 23),
                                    child: MyHours(
                                      date: data?.hourlyTime[i]
                                              .toString()
                                              .substring(11) ??
                                          "0",
                                      image: iconCheck(i),
                                      temp: "${data?.hourlyTemp[i]}°",
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        MyDecoratedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (int i = 0;
                                  i < [data?.dailyTime ?? []].first.length;
                                  i++)
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Text(
                                        DateFormat("d MMM").format(
                                          DateTime.parse(data?.dailyTime[i]),
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(color: Colors.white),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Image(
                                        width: 30,
                                        image: AssetImage(
                                          "assets/icons/${data?.dailyCode[i]}.png",
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        data?.dailyMax[i].toString() ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(width: 20),
                                      Image(
                                        width: 30,
                                        image: AssetImage(
                                          night(data?.dailyCode[i]),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        data?.dailyMin[i].toString() ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: MyDecoratedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.air,
                                          color: Colors.white.withOpacity(0.8),
                                          size: 25,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "WIND",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                              ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "${data?.currentWindspeed} km/h",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: MyDecoratedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.thermostat,
                                          color: Colors.white.withOpacity(0.8),
                                          size: 25,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "FEELS LIKE",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                              ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "${data?.hourlyTemp[DateTime.now().hour]} °C",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
