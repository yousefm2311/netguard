import '../../features/activity_history/domain/entities/activity_event.dart';
import '../../features/analytics/domain/entities/network_stats.dart';
import '../../features/auth/domain/entities/auth_session.dart';
import '../../features/devices/domain/entities/network_device.dart';
import '../../features/guest_access/domain/entities/guest_access_settings.dart';
import '../../features/help_center/domain/entities/help_article.dart';
import '../../features/router_profile/domain/entities/router_profile.dart';
import '../../features/security_settings/domain/entities/security_settings_state.dart';

class MockBackend {
  static AuthSession login(String username, String password) {
    return AuthSession(
      token: 'mock-token-123',
      userId: 'admin-1',
      userName: username.isEmpty ? 'Network Admin' : username,
      role: 'admin',
    );
  }

  static List<NetworkDevice> devices() {
    return [
      const NetworkDevice(
        id: '1',
        name: 'Office MacBook Pro',
        ip: '192.168.1.14',
        mac: 'B8:27:EB:43:A1:91',
        usageGb: 124.2,
        isBlocked: false,
        speedLimitMbps: 80,
        quotaGb: 350,
        status: 'online',
      ),
      const NetworkDevice(
        id: '2',
        name: 'Gaming Console',
        ip: '192.168.1.33',
        mac: 'A0:14:3D:91:AA:11',
        usageGb: 212.7,
        isBlocked: false,
        speedLimitMbps: 120,
        quotaGb: 500,
        status: 'online',
      ),
      const NetworkDevice(
        id: '3',
        name: 'Guest iPhone',
        ip: '192.168.1.77',
        mac: 'CC:18:7B:44:18:39',
        usageGb: 18.6,
        isBlocked: true,
        speedLimitMbps: 8,
        quotaGb: 20,
        status: 'blocked',
      ),
      const NetworkDevice(
        id: '4',
        name: 'Living Room TV',
        ip: '192.168.1.49',
        mac: 'EE:20:10:49:71:31',
        usageGb: 64.8,
        isBlocked: false,
        speedLimitMbps: 40,
        quotaGb: 120,
        status: 'idle',
      ),
    ];
  }

  static NetworkStats stats() {
    final deviceList = devices();
    return NetworkStats(
      connectedDevicesCount: 18,
      totalUsageGb: 742.5,
      topDevice: deviceList[1],
      dailyUsageGb: const [62, 75, 71, 94, 108, 116, 123],
      deviceComparisonGb: deviceList
          .map((device) => DeviceUsageSlice(label: device.name, value: device.usageGb))
          .toList(),
      alerts: const [
        '2 new devices joined the network.',
        'Guest profile exceeded 80% of quota.',
        'Router profile synced 3 minutes ago.',
      ],
      isMocked: true,
    );
  }

  static RouterProfile routerProfile() {
    return const RouterProfile(
      model: 'TP-Link Archer AX73',
      firmwareVersion: '1.3.7',
      supportsQuota: true,
      supportsSpeedLimit: true,
      downloadedAt: '2026-05-09T11:30:00Z',
      rawProfileJson:
          '{"model":"TP-Link Archer AX73","features":["quota","speed-limit","blocking"]}',
    );
  }

  static List<ActivityEvent> activityEvents() {
    return const [
      ActivityEvent(
        id: 'act-1',
        title: 'Large download detected',
        description: 'Gaming Console consumed 18.4 GB in the last session.',
        deviceId: '2',
        deviceName: 'Gaming Console',
        category: 'usage',
        timestampLabel: '5 min ago',
        severity: 'high',
      ),
      ActivityEvent(
        id: 'act-2',
        title: 'Guest device blocked',
        description: 'Guest iPhone exceeded the assigned traffic quota.',
        deviceId: '3',
        deviceName: 'Guest iPhone',
        category: 'security',
        timestampLabel: '18 min ago',
        severity: 'medium',
      ),
      ActivityEvent(
        id: 'act-3',
        title: 'Router profile synced',
        description: 'Profile cache refreshed successfully.',
        deviceId: 'router',
        deviceName: 'Router',
        category: 'system',
        timestampLabel: '32 min ago',
        severity: 'low',
      ),
      ActivityEvent(
        id: 'act-4',
        title: 'Bandwidth limit changed',
        description: 'Office MacBook Pro limit updated to 80 Mbps.',
        deviceId: '1',
        deviceName: 'Office MacBook Pro',
        category: 'admin',
        timestampLabel: '1 hr ago',
        severity: 'low',
      ),
    ];
  }

  static GuestAccessSettings guestAccessSettings() {
    return const GuestAccessSettings(
      enabled: true,
      networkName: 'SmartNet-Guest',
      password: 'guest@1234',
      quotaGb: 25,
      speedLimitMbps: 15,
      scheduleLabel: 'Daily 8:00 AM - 11:00 PM',
    );
  }

  static SecuritySettingsState securitySettingsState() {
    return const SecuritySettingsState(
      firewallEnabled: true,
      macFilteringEnabled: true,
      intrusionAlertsEnabled: true,
      autoBlockSuspiciousDevices: false,
      passwordRotationDays: 45,
    );
  }

  static List<HelpArticle> helpArticles() {
    return const [
      HelpArticle(
        id: 'help-1',
        title: 'How to block a device instantly',
        summary: 'Open Devices Management, select a device, and use the block action.',
        category: 'Devices',
      ),
      HelpArticle(
        id: 'help-2',
        title: 'Why am I seeing mock data?',
        summary: 'Mock data appears whenever the backend is unavailable or not configured.',
        category: 'System',
      ),
      HelpArticle(
        id: 'help-3',
        title: 'How to enable guest access',
        summary: 'Use the Guest Access screen to enable a temporary isolated network.',
        category: 'Guest Access',
      ),
      HelpArticle(
        id: 'help-4',
        title: 'How to rotate WiFi credentials',
        summary: 'Update your router and security settings regularly to reduce risk.',
        category: 'Security',
      ),
    ];
  }
}
