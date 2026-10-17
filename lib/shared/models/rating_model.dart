class RatingModel {
  const RatingModel({
    required this.id,
    required this.specialistId,
    required this.raterId,
    required this.raterName,
    required this.value,
    required this.message,
    required this.createdAt,
  });

  final String id;
  final String specialistId;
  final String raterId;
  final String raterName;
  final double value;
  final String message;
  final DateTime createdAt;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'specialistId': specialistId,
      'raterId': raterId,
      'raterName': raterName,
      'value': value,
      'message': message,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      id: map['id'] as String,
      specialistId: map['specialistId'] as String,
      raterId: map['raterId'] as String,
      raterName: map['raterName'] as String,
      value: (map['value'] as num).toDouble(),
      message: map['message'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}
