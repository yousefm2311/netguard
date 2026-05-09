import '../entities/network_device.dart';

abstract class DevicesRepository {
  Future<List<NetworkDevice>> fetchDevices();

  Future<void> blockDevice(String deviceId);

  Future<void> limitSpeed(String deviceId, int speedMbps);

  Future<void> setQuota(String deviceId, int quotaGb);
}
