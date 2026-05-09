class EventLog {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String type; // security, system, traffic, devices
  final String timeAgo;
  final String tag;

  EventLog({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.type,
    required this.timeAgo,
    required this.tag,
  });

  factory EventLog.fromJson(Map<String, dynamic> json) {
    return EventLog(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? 'info',
      timeAgo: json['timeAgo'] ?? '',
      tag: json['tag'] ?? '',
    );
  }
}
