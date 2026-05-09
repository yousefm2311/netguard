import '../../data/repositories/device_repository.dart';
import '../../data/models/device.dart';

class GetDevicesUseCase {
  final DeviceRepository _repository;

  GetDevicesUseCase(this._repository);

  Future<List<Device>> execute() {
    return _repository.getDevices();
  }
}

class BlockDeviceUseCase {
  final DeviceRepository _repository;

  BlockDeviceUseCase(this._repository);

  Future<void> execute(String deviceId) {
    return _repository.blockDevice(deviceId);
  }
}

class LimitSpeedUseCase {
  final DeviceRepository _repository;

  LimitSpeedUseCase(this._repository);

  Future<void> execute(String deviceId, double speed) {
    return _repository.limitSpeed(deviceId, speed);
  }
}
