import 'dart:async';
import 'dart:math';
import 'dart:developer' as log;
import 'package:distinct_assignment/core/endpoints/socket_endpoints.dart';
import 'package:distinct_assignment/data/services/image/image_picker_service.dart';
import 'package:distinct_assignment/data/socket_service/socket_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fl_chart/fl_chart.dart';

class OddController extends GetxController {
  final oddsText = 'Waiting for odds...'.obs;
  final chartData = <FlSpot>[].obs;
  final imagePath = ''.obs;
  final stats = ''.obs;

  WebSocketService? _webSocketService;
  Timer? _sendTimer;
  Timer? _pollingTimer;

  /// Counter for x-axis values in the chart
  /// Starts at 0 and increments with each new data point
  int _x = 0;

  @override
  void onInit() {
    super.onInit();
    _connectWebSocket();
  }

  void _connectWebSocket() {
    try {
      _webSocketService = WebSocketService(SocketEndpoints.serverEndpoint);
      _webSocketService!.connect(
        listener: (message) {
          log.log('WebSocket message received: $message');
          _updateOdds(message);
          _pollingTimer?.cancel();
        },
        onErrors: (error) {
          print('WebSocket error: $error');
          _startPolling();
        },
        onDones: () {
          print('WebSocket connection closed.');
          _startPolling();
        },
      );
      _sendTimer = Timer.periodic(Duration(seconds: 3), (_) {
        final fakeOdds = _generateFakeOdds();
        _webSocketService?.sendMessage(fakeOdds);
        _pollingTimer?.cancel();
      });
    } catch (_) {
      _startPolling();
    }
  }

  void _startPolling() {
    _sendTimer?.cancel();
    _pollingTimer = Timer.periodic(Duration(seconds: 5), (_) {
      final fakeOdds = _generateFakeOdds();
      _updateOdds(fakeOdds);
    });
  }

  void _updateOdds(String value) {
    oddsText.value = value;
    final y = double.tryParse(value) ?? 0;
    print('Parsed odds value: $y from "$value"');
    chartData.add(FlSpot(_x.toDouble(), y));
    if (chartData.length > 20) chartData.removeAt(0); // keep recent 20
    _x++;
  }

  /// Generates a random odds value as a string
  String _generateFakeOdds() {
    final random = Random();
    return (random.nextDouble() * 100).toStringAsFixed(2);
  }

  /// picking an image and updating stats
  Future<void> pickImage() async {
    final picked = await ImagePickerService.pickImage();

    if (picked != null) {
      imagePath.value = picked.path;
      stats.value = _simulateStats();
    }
  }

  /// Removes the selected image and resets stats
  void removeImage() {
    imagePath.value = '';
    stats.value = '';
  }

  String _simulateStats() {
    final random = Random();
    return 'Runs: ${random.nextInt(300)}\nWickets: ${random.nextInt(10)}';
  }

  @override
  void onClose() {
    _sendTimer?.cancel();
    _pollingTimer?.cancel();
    _webSocketService?.disconnect();
    super.onClose();
  }
}
