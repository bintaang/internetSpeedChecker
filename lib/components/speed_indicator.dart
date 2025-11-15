import 'package:flutter/material.dart';
import 'package:speed_test_dart/speed_test_dart.dart';
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
  double speedDownload = 0;
  double speedUpload = 0;

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Text('The Animation Will Be Here'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [Text('Accumulative Speed'), Text('Download Speed')],
            ),
            Column(
              children: [Text('Accumulative Speed'), Text('Download Speed')],
            ),
          ],
        ),
      ],
    );
  }
}
