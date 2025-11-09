import 'package:speed_test_dart/classes/server.dart';
import 'package:speed_test_dart/speed_test_dart.dart';

class SpeedTestService {
  bool isGettingData = false;
  SpeedTestDart tester = SpeedTestDart();
  List<Server> bestServerList = <Server>[];

  Future<void> setBestServers() async {
    final settings = await tester.getSettings();
    final List<Server> servers = settings.servers;
    final List<Server> serverList = await tester.getBestServers(
      servers: servers,
    );
    bestServerList = serverList;
  }

  Future<SpeedInternetTypeInterface> getSpeedInternetData() async {
    final double download = await tester.testDownloadSpeed(
      servers: bestServerList,
    );
    final double upload = await tester.testUploadSpeed(servers: bestServerList);

    return SpeedInternetTypeInterface(
      downloadSpeed: download,
      uploadSpeed: upload,
    );
  }
}

class SpeedInternetTypeInterface {
  final double downloadSpeed;
  final double uploadSpeed;

  SpeedInternetTypeInterface({
    required this.downloadSpeed,
    required this.uploadSpeed,
  });
}
