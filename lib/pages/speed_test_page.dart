import 'package:flutter/material.dart';
import 'package:speednetworkapp/components/primary_button.dart';
import 'package:speednetworkapp/components/speed_indicator.dart';
import 'package:speednetworkapp/services/speed_test_service.dart';

class SpeedTestPage extends StatefulWidget {
  const SpeedTestPage({super.key});
  @override
  State<SpeedTestPage> createState() => _SpeedTestPageState();
}

class _SpeedTestPageState extends State<SpeedTestPage> {
  final server = SpeedTestService();
  bool isTrigger = false;
  void buttonTrigger() {
    setState(() {
      isTrigger = !isTrigger;
    });
  }

  @override
  void initState() {
    super.initState();
    server.setBestServers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Speed Test App"),
            SpeedIndicator(trigger: isTrigger),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  placeHolder: 'Test Speed',
                  fnc: buttonTrigger,
                  onPressed: isTrigger,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
