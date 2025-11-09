import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speednetworkapp/services/speed_test_service.dart';

class SpeedIndicator extends StatefulWidget {
  const SpeedIndicator({super.key, required this.trigger});
  final bool trigger;
  @override
  State<SpeedIndicator> createState() => _SpeedIndicatorState();
}

class _SpeedIndicatorState extends State<SpeedIndicator> {
  final server = SpeedTestService();
  bool isLoading = false;
  bool isError = false;
  double speedUpload = 0.0;
  double speedDownload = 0.0;
  String errorMessage = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.trigger == true) {
      getData();
    }
  }

  @override
  void didUpdateWidget(SpeedIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.trigger == true && !oldWidget.trigger) {
      getData();
    }
  }

  void getData() async {
    try {
      setState(() {
        server.isGettingData = true;
        isLoading = true;
        isError = false;
        errorMessage = '';
      });
      randomNumber();
      final data = await server.getSpeedInternetData();
      setState(() {
        server.isGettingData = false;
        speedUpload = data.uploadSpeed;
        speedDownload = data.downloadSpeed;
        isLoading = false;
      });
    } catch (e) {
      stopRandom();
    }
  }

  void randomNumber() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (time) {
      speedUpload++;
      speedDownload++;
    });
  }

  void stopRandom() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Text(isLoading ? 'Loading ...' : 'Done'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(speedDownload.toString()),
                Text('Download Speed'),
              ],
            ),
            Column(
              children: [Text(speedUpload.toString()), Text('Download Speed')],
            ),
          ],
        ),
      ],
    );
  }
}
