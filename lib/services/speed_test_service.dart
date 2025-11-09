import 'package:speed_test_dart/classes/server.dart';
import 'package:speed_test_dart/speed_test_dart.dart';

class SpeedTestService {
  bool isGettingData = false;
  final SpeedTestDart tester = SpeedTestDart();
  List<Server> bestServerList = <Server>[];

  Future<void> setBestServers() async {
    final settings = await tester.getSettings();
    final servers = settings.servers;
    bestServerList = await tester.getBestServers(servers: servers);
  }

  Future<SpeedResult> getSpeedInternetData() async {
    try {
      if (bestServerList.isEmpty) await setBestServers();

      final download = await tester.testDownloadSpeed(servers: bestServerList);
      final upload = await tester.testUploadSpeed(servers: bestServerList);

      return SpeedResult(downloadSpeed: download, uploadSpeed: upload);
    } catch (e) {
      throw Exception('Failed to get speed data: $e');
    }
  }
}

class SpeedResult {
  final double downloadSpeed;
  final double uploadSpeed;

  SpeedResult({required this.downloadSpeed, required this.uploadSpeed});
}
