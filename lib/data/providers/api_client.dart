import 'package:dio/dio.dart';

class ApiClient {
  late Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://mock-api.smartnet.com/api',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        await Future.delayed(const Duration(milliseconds: 800)); // Simulate network latency
        
        if (options.path.contains('/login')) {
          return handler.resolve(Response(
            requestOptions: options,
            statusCode: 200,
            data: {
              'token': 'mock_jwt_token_12345',
              'user': {'id': 1, 'name': 'Expert User', 'role': 'admin'}
            },
          ));
        }

        if (options.path.contains('/devices')) {
          return handler.resolve(Response(
            requestOptions: options,
            statusCode: 200,
            data: {
              'devices': [
                {'id': '1', 'name': 'iPhone 15 Pro', 'ip': '192.168.1.142', 'mac': 'AA:BB:CC:DD:EE:01', 'type': 'mobile', 'currentSpeed': 42.5, 'totalUsage': 1.2, 'speedLimit': 80.0, 'limitUnlimited': false, 'isBlocked': false},
                {'id': '2', 'name': 'MacBook Pro 16', 'ip': '192.168.1.105', 'mac': 'AA:BB:CC:DD:EE:02', 'type': 'laptop', 'currentSpeed': 215.8, 'totalUsage': 45.2, 'speedLimit': 0.0, 'limitUnlimited': true, 'isBlocked': false},
                {'id': '3', 'name': 'Living Room TV', 'ip': '192.168.1.121', 'mac': 'AA:BB:CC:DD:EE:03', 'type': 'tv', 'currentSpeed': 0.0, 'totalUsage': 182.0, 'speedLimit': 25.0, 'limitUnlimited': false, 'isBlocked': true},
                {'id': '4', 'name': 'Entry Camera', 'ip': '192.168.1.18', 'mac': 'AA:BB:CC:DD:EE:04', 'type': 'camera', 'currentSpeed': 4.2, 'totalUsage': 12.8, 'speedLimit': 10.0, 'limitUnlimited': false, 'isBlocked': false},
                {'id': '5', 'name': 'PlayStation 5', 'ip': '192.168.1.55', 'mac': 'AA:BB:CC:DD:EE:05', 'type': 'console', 'currentSpeed': 98.2, 'totalUsage': 340.0, 'speedLimit': 0.0, 'limitUnlimited': true, 'isBlocked': false},
              ]
            },
          ));
        }

        if (options.path.contains('/stats')) {
          return handler.resolve(Response(
            requestOptions: options,
            statusCode: 200,
            data: {
              'connectedCount': 14,
              'totalUsage': 4.2, 
              'downloadSpeed': 450.0,
              'topDeviceName': 'Living Room Entertainment',
              'topDeviceSubtitle': 'Streaming 4K HDR Content • Active for 4h 12m',
              'topDeviceUsage': 1.8,
              'blocksToday': 12,
              'networkHealth': 'Stable',
              'recentActivity': [
                {'id': '1', 'title': 'MacBook Pro 14"', 'subtitle': 'Joined 5GHz Network', 'description': '', 'type': 'info', 'timeAgo': '2 mins ago', 'tag': '5GHz'},
                {'id': '2', 'title': 'iPhone 15 Pro', 'subtitle': 'High data usage detected', 'description': '', 'type': 'alert', 'timeAgo': '15 mins ago', 'tag': 'Alert'},
                {'id': '3', 'title': 'Smart Light Hub', 'subtitle': 'Stable connection', 'description': '', 'type': 'info', 'timeAgo': '1 hour ago', 'tag': ''},
              ],
              'activityHistory': [
                {'id': '101', 'title': 'Security threat blocked:', 'subtitle': '192.168.1.1', 'description': 'Suspicious connection attempt identified and isolated.', 'type': 'security', 'timeAgo': '2m ago', 'tag': 'Security'},
                {'id': '102', 'title': 'Firmware updated to', 'subtitle': 'v2.4.0', 'description': 'Automatic system optimization and security patches applied.', 'type': 'system', 'timeAgo': '1h ago', 'tag': 'System'},
                {'id': '103', 'title': 'High usage alert: Living Room TV', 'subtitle': '', 'description': 'Streaming activity exceeded typical threshold (4K Ultra HD detected).', 'type': 'traffic', 'timeAgo': '4h ago', 'tag': 'Traffic'},
                {'id': '104', 'title': 'New device connected:', 'subtitle': 'iPhone 15', 'description': 'Unrecognized device joined the Primary Network via Wi-Fi 6.', 'type': 'devices', 'timeAgo': '6h ago', 'tag': 'Devices'},
              ]
            },
          ));
        }

        return handler.resolve(Response(requestOptions: options, statusCode: 200, data: {'success': true}));
      },
    ));
  }

  Dio get client => _dio;
}
