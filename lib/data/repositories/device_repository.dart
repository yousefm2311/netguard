import '../providers/api_client.dart';
import '../models/device.dart';

class DeviceRepository {
  final ApiClient _apiClient;

  DeviceRepository(this._apiClient);

  Future<List<Device>> getDevices() async {
    try {
      final response = await _apiClient.client.get('/devices');
      final List<dynamic> devicesJson = response.data['devices'];
      return devicesJson.map((json) => Device.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch devices: $e');
    }
  }

  Future<void> blockDevice(String deviceId) async {
    try {
      await _apiClient.client.post('/device/block', data: {'id': deviceId});
    } catch (e) {
      throw Exception('Failed to block device: $e');
    }
  }

  Future<void> limitSpeed(String deviceId, double speed) async {
    try {
      await _apiClient.client.post('/device/speed-limit', data: {'id': deviceId, 'speed': speed});
    } catch (e) {
      throw Exception('Failed to limit speed: $e');
    }
  }
}
