class Device {
  final String id;
  final String name;
  final String ip;
  final String mac;
  final String type; // mobile, laptop, tv, camera, etc.
  final double currentSpeed; // Mbps
  final double totalUsage; // GB
  final double speedLimit; // Mbps
  final bool limitUnlimited;
  final bool isBlocked;

  Device({
    required this.id,
    required this.name,
    required this.ip,
    required this.mac,
    required this.type,
    required this.currentSpeed,
    required this.totalUsage,
    required this.speedLimit,
    required this.limitUnlimited,
    required this.isBlocked,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      ip: json['ip'] ?? '',
      mac: json['mac'] ?? '',
      type: json['type'] ?? 'unknown',
      currentSpeed: (json['currentSpeed'] ?? 0).toDouble(),
      totalUsage: (json['totalUsage'] ?? 0).toDouble(),
      speedLimit: (json['speedLimit'] ?? 0).toDouble(),
      limitUnlimited: json['limitUnlimited'] ?? true,
      isBlocked: json['isBlocked'] ?? false,
    );
  }
  
  Device copyWith({
    String? id,
    String? name,
    String? ip,
    String? mac,
    String? type,
    double? currentSpeed,
    double? totalUsage,
    double? speedLimit,
    bool? limitUnlimited,
    bool? isBlocked,
  }) {
    return Device(
      id: id ?? this.id,
      name: name ?? this.name,
      ip: ip ?? this.ip,
      mac: mac ?? this.mac,
      type: type ?? this.type,
      currentSpeed: currentSpeed ?? this.currentSpeed,
      totalUsage: totalUsage ?? this.totalUsage,
      speedLimit: speedLimit ?? this.speedLimit,
      limitUnlimited: limitUnlimited ?? this.limitUnlimited,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }

  // To easily match the previous `usage` property
  double get usage => totalUsage;
}
