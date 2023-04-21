import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sensors/flutter_sensors.dart';
import 'package:gyroscope_challenge/app/utils/responsive_util.dart';
import 'package:gyroscope_challenge/modules/home/widgets/card_widget.dart';
import 'package:simple_kalman/simple_kalman.dart';

import '../widgets/bubbles_background_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const accent = Color(0xff3633c4);
  static const cardColor = Color(0xff793ecf);
  static const secondary = Color(0xff9248ce);
  static const bubblesColors = [
    Color(0xff4419c5),
    Color(0xff5121c3),
    Color(0xff682cd2),
    accent,
    cardColor,
    secondary,
  ];

  late final List<double> bubblesPositions;
  late final List<int> bubblesDirections;

  late final Stream<SensorEvent> stream;
  late final StreamSubscription<SensorEvent> suscription;
  final kalmanX = SimpleKalman(q: 0.01, errorMeasure: 0.1, errorEstimate: 0.1);
  final kalmanY = SimpleKalman(q: 0.01, errorMeasure: 0.1, errorEstimate: 0.1);

  final List<List<double>> gyroData = [];
  final int windowSize = 5;

  double x = 0;
  double y = 0;
  double z = 0;

  @override
  void initState() {
    super.initState();
    bubblesPositions = List.generate(
      bubblesColors.length * 2,
      (x) => Random().nextDouble(),
    );
    bubblesDirections = List.generate(
        bubblesColors.length, (x) => Random().nextBool() ? 1 : -1);
    initStream();
  }

  void initStream() async {
    stream = await SensorManager().sensorUpdates(
      sensorId: 1,
      interval: const Duration(milliseconds: 0),
    );
    suscription = stream.listen((event) {
      setState(() {
        final clampledX = clampDouble(event.data[0], -0.45, 0.45);
        final clampledY = clampDouble(event.data[1], -0.45, 0.45);
        x = kalmanX.filtered(clampledX);
        y = kalmanY.filtered(clampledY);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xff3633c4);
    const cardColor = Color(0xff793ecf);
    final resp = ResponsiveUtil.of(context);

    return Scaffold(
      body: Container(
        // duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              accent,
              cardColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [x, y],
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              BubblesBackgroundWidget(
                colors: bubblesColors,
                positions: bubblesPositions,
                directions: bubblesDirections,
                x: y,
                y: x,
              ),
              SizedBox(
                height: resp.height,
                width: resp.width,
              ),
              CardWidget(color: cardColor, x: x, y: y),
            ],
          ),
        ),
      ),
    );
  }
}
