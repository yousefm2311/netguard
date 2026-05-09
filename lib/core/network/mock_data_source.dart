import '../../features/auth/data/models/user_model.dart';
import '../../features/devices/data/models/device_model.dart';
import '../../features/dashboard/data/models/dashboard_stats.dart';
import '../../features/activity_log/data/models/log_entry.dart';
import '../../features/network_log/data/models/network_log_entry.dart';
import '../../features/schedule/data/models/schedule.dart';
import '../../features/guest_access/data/models/guest_config.dart';
import '../../features/router_profile/data/models/router_info.dart';
import '../../features/security_settings/data/models/security_settings.dart';

class MockDataSource {
  static final UserModel currentUser = UserModel(
    id: 'usr_01',
    name: 'Admin Expert',
    email: 'admin@smartnet.local',
    role: 'admin',
  );

  static final List<DeviceModel> devices = [
    DeviceModel(
      id: 'dev_1',
      name: "Ahmed's iPhone",
      ip: "192.168.1.2",
      mac: "AA:BB:CC:DD:EE:01",
      status: "online",
      usageToday: 2.3 * 1024 * 1024 * 1024, // 2.3 GB in bytes
      usageWeekly: 14.5 * 1024 * 1024 * 1024,
      usageMonthly: 45.2 * 1024 * 1024 * 1024,
      speedLimit: null,
      quota: 10,
      quotaPeriod: 'month',
      connectedAt: DateTime.now().subtract(const Duration(hours: 5)),
      lastSeen: DateTime.now(),
    ),
    DeviceModel(
      id: 'dev_2',
      name: "Smart TV",
      ip: "192.168.1.3",
      mac: "AA:BB:CC:DD:EE:02",
      status: "online",
      usageToday: 5.1 * 1024 * 1024 * 1024,
      usageWeekly: 25.1 * 1024 * 1024 * 1024,
      usageMonthly: 120.0 * 1024 * 1024 * 1024,
      connectedAt: DateTime.now().subtract(const Duration(days: 2)),
      lastSeen: DateTime.now(),
    ),
    DeviceModel(
      id: 'dev_3',
      name: "Laptop Work",
      ip: "192.168.1.4",
      mac: "AA:BB:CC:DD:EE:03",
      status: "blocked",
      usageToday: 0,
      usageWeekly: 2.1 * 1024 * 1024 * 1024,
      usageMonthly: 15.0 * 1024 * 1024 * 1024,
      connectedAt: DateTime.now().subtract(const Duration(days: 5)),
      lastSeen: DateTime.now().subtract(const Duration(days: 1)),
    ),
    DeviceModel(
      id: 'dev_4',
      name: "Gaming PC",
      ip: "192.168.1.5",
      mac: "AA:BB:CC:DD:EE:04",
      status: "limited",
      speedLimit: 5,
      usageToday: 8.2 * 1024 * 1024 * 1024,
      usageWeekly: 45.0 * 1024 * 1024 * 1024,
      usageMonthly: 210.0 * 1024 * 1024 * 1024,
      connectedAt: DateTime.now().subtract(const Duration(hours: 12)),
      lastSeen: DateTime.now(),
    ),
    DeviceModel(
      id: 'dev_5',
      name: "Sara's Phone",
      ip: "192.168.1.6",
      mac: "AA:BB:CC:DD:EE:05",
      status: "online",
      usageToday: 1.1 * 1024 * 1024 * 1024,
      usageWeekly: 8.5 * 1024 * 1024 * 1024,
      usageMonthly: 30.2 * 1024 * 1024 * 1024,
      connectedAt: DateTime.now().subtract(const Duration(hours: 2)),
      lastSeen: DateTime.now(),
    ),
    DeviceModel(
      id: 'dev_6',
      name: "Tablet",
      ip: "192.168.1.7",
      mac: "AA:BB:CC:DD:EE:06",
      status: "online",
      usageToday: 0.5 * 1024 * 1024 * 1024,
      usageWeekly: 3.2 * 1024 * 1024 * 1024,
      usageMonthly: 12.0 * 1024 * 1024 * 1024,
      connectedAt: DateTime.now().subtract(const Duration(days: 1)),
      lastSeen: DateTime.now(),
    ),
    DeviceModel(
      id: 'dev_7',
      name: "Security Cam",
      ip: "192.168.1.8",
      mac: "AA:BB:CC:DD:EE:07",
      status: "online",
      usageToday: 0.8 * 1024 * 1024 * 1024,
      usageWeekly: 5.6 * 1024 * 1024 * 1024,
      usageMonthly: 24.0 * 1024 * 1024 * 1024,
      connectedAt: DateTime.now().subtract(const Duration(days: 30)),
      lastSeen: DateTime.now(),
    ),
    DeviceModel(
      id: 'dev_8',
      name: "Old Laptop",
      ip: "192.168.1.9",
      mac: "AA:BB:CC:DD:EE:08",
      status: "online",
      usageToday: 3.7 * 1024 * 1024 * 1024,
      usageWeekly: 12.0 * 1024 * 1024 * 1024,
      usageMonthly: 50.0 * 1024 * 1024 * 1024,
      connectedAt: DateTime.now().subtract(const Duration(days: 3)),
      lastSeen: DateTime.now(),
    ),
  ];

  static DashboardStats get dashboardStats {
    final now = DateTime.now();
    return DashboardStats(
      connectedCount: devices.where((d) => d.status != 'blocked').length,
      totalUsageToday: devices.fold(0.0, (sum, d) => sum + d.usageToday),
      activeAlerts: 3,
      topDevice: devices.reduce((a, b) => a.usageToday > b.usageToday ? a : b),
      usageChart: [
        DailyUsage(date: now.subtract(const Duration(days: 6)), usage: 12.5 * 1024 * 1024 * 1024),
        DailyUsage(date: now.subtract(const Duration(days: 5)), usage: 15.2 * 1024 * 1024 * 1024),
        DailyUsage(date: now.subtract(const Duration(days: 4)), usage: 10.8 * 1024 * 1024 * 1024),
        DailyUsage(date: now.subtract(const Duration(days: 3)), usage: 22.1 * 1024 * 1024 * 1024),
        DailyUsage(date: now.subtract(const Duration(days: 2)), usage: 18.5 * 1024 * 1024 * 1024),
        DailyUsage(date: now.subtract(const Duration(days: 1)), usage: 14.0 * 1024 * 1024 * 1024),
        DailyUsage(date: now, usage: 21.7 * 1024 * 1024 * 1024),
      ],
    );
  }

  static final List<LogEntry> activityLogs = [
    LogEntry(id: 'log_1', deviceId: 'dev_1', deviceName: "Ahmed's iPhone", action: 'Connected to network', description: 'Device authenticated successfully', timestamp: DateTime.now().subtract(const Duration(minutes: 5)), type: 'connect'),
    LogEntry(id: 'log_2', deviceId: 'dev_3', deviceName: "Laptop Work", action: 'Access Blocked', description: 'Admin initiated manual block', timestamp: DateTime.now().subtract(const Duration(hours: 1)), type: 'block'),
    LogEntry(id: 'log_3', deviceId: 'dev_4', deviceName: "Gaming PC", action: 'Speed Limited', description: 'Limit set to 5 Mbps', timestamp: DateTime.now().subtract(const Duration(hours: 3)), type: 'limit'),
    LogEntry(id: 'log_4', deviceId: 'dev_2', deviceName: "Smart TV", action: 'High Usage Warning', description: 'Exceeded 5GB daily average', timestamp: DateTime.now().subtract(const Duration(hours: 5)), type: 'quota'),
  ];

  static final List<NetworkLogEntry> networkLogs = [
    NetworkLogEntry(id: 'nl_1', deviceId: 'dev_1', domain: 'api.apple.com', protocol: 'HTTPS', action: 'allow', timestamp: DateTime.now().subtract(const Duration(seconds: 10)), bytes: 15420),
    NetworkLogEntry(id: 'nl_2', deviceId: 'dev_4', domain: 'steamcommunity.com', protocol: 'HTTPS', action: 'allow', timestamp: DateTime.now().subtract(const Duration(seconds: 45)), bytes: 204800),
    NetworkLogEntry(id: 'nl_3', deviceId: 'dev_3', domain: 'malicious-domain.com', protocol: 'HTTP', action: 'block', timestamp: DateTime.now().subtract(const Duration(minutes: 2)), bytes: 0),
  ];

  static final List<Schedule> schedules = [
    Schedule(id: 'sch_1', deviceId: 'dev_2', deviceName: "Smart TV", startTime: "23:00", endTime: "06:00", days: [1,2,3,4,5], type: 'block', isActive: true),
    Schedule(id: 'sch_2', deviceId: 'dev_4', deviceName: "Gaming PC", startTime: "20:00", endTime: "23:59", days: [6,7], type: 'limit', speedValue: 10, isActive: true),
  ];

  static final GuestConfig guestConfig = GuestConfig(
    ssid: 'SmartNet_Guest',
    password: 'guest_secure_123',
    isEnabled: true,
    duration: 4,
    speedLimit: 20,
  );

  static final RouterInfo routerInfo = RouterInfo(
    model: 'Archer AX50',
    brand: 'TP-Link',
    firmware: '1.0.11 Build 20210730',
    ip: '192.168.1.1',
    mac: 'E8:48:B8:C8:D8:E8',
    lastDetected: DateTime.now(),
  );

  static final SecuritySettings securitySettings = SecuritySettings(
    threatProtection: true,
    firewall: true,
    portScanDetection: false,
    securityScore: 85,
  );
  
  static final List<Threat> threats = [
    Threat(id: 'thr_1', type: 'DDoS Attempt', severity: 'high', description: 'Multiple connection requests dropped', timestamp: DateTime.now().subtract(const Duration(days: 1)), sourceIp: '185.15.x.x'),
    Threat(id: 'thr_2', type: 'Port Scan', severity: 'medium', description: 'Sequential port scan detected', timestamp: DateTime.now().subtract(const Duration(days: 3)), sourceIp: '192.241.x.x'),
  ];
}
