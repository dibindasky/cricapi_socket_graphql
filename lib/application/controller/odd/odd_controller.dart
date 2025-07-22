import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fl_chart/fl_chart.dart';

class OddController extends GetxController {
  final oddsText = 'Waiting for odds...'.obs;
  final chartData = <FlSpot>[].obs;
  final imagePath = ''.obs;
  final stats = ''.obs;

  WebSocketChannel? _channel;
  Timer? _sendTimer;
  Timer? _pollingTimer;
  int _x = 0;

  @override
  void onInit() {
    super.onInit();
    _connectWebSocket();
  }

  void _connectWebSocket() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'));
      _channel!.stream.listen((message) {
        _updateOdds(message);
      }, onError: (_) => _startPolling(), onDone: () => _startPolling());

      _sendTimer = Timer.periodic(Duration(seconds: 3), (_) {
        final fakeOdds = _generateFakeOdds();
        _channel?.sink.add(fakeOdds);
      });
    } catch (_) {
      _startPolling();
    }
  }

  void _startPolling() {
    _sendTimer?.cancel();
    _pollingTimer = Timer.periodic(Duration(seconds: 5), (_) {
      final fakeOdds = '${_generateFakeOdds()} (polled)';
      _updateOdds(fakeOdds);
    });
  }

  void _updateOdds(String value) {
    oddsText.value = value;
    final y = double.tryParse(value.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
    chartData.add(FlSpot(_x.toDouble(), y));
    if (chartData.length > 20) chartData.removeAt(0); // keep recent 20
    _x++;
  }

  String _generateFakeOdds() {
    final random = Random();
    return (random.nextDouble() * 100).toStringAsFixed(2);
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      imagePath.value = picked.path;
      stats.value = _simulateStats();
    }
  }

  String _simulateStats() {
    final random = Random();
    return 'Runs: ${random.nextInt(300)}\nWickets: ${random.nextInt(10)}';
  }

  @override
  void onClose() {
    _sendTimer?.cancel();
    _pollingTimer?.cancel();
    _channel?.sink.close();
    super.onClose();
  }
}
