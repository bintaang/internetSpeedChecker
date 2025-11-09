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
    if (widget.trigger) {
      getData();
    }
  }

  @override
  void didUpdateWidget(SpeedIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.trigger && !oldWidget.trigger) {
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
        speedUpload = 0.0;
        speedDownload = 0.0;
      });
      randomNumber();
      final data = await server.getSpeedInternetData();
      stopRandom();
      setState(() {
        server.isGettingData = false;
        speedUpload = data.uploadSpeed;
        speedDownload = data.downloadSpeed;
        isLoading = false;
      });
    } catch (e) {
      stopRandom();
      setState(() {
        server.isGettingData = false;
        isLoading = false;
        isError = true;
        errorMessage = e.toString();
      });
    }
  }

  void randomNumber() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {
        speedUpload++;
        speedDownload++;
      });
    });
  }

  void stopRandom() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Text(isLoading ? 'Loading ...' : 'Done'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(speedDownload.toStringAsFixed(2)),
                const Text('Download Speed'),
              ],
            ),
            Column(
              children: [
                Text(speedUpload.toStringAsFixed(2)),
                const Text('Upload Speed'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
