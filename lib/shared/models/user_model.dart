import 'package:thiquat_al_iklim/shared/models/rating_model.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';
import 'package:thiquat_al_iklim/shared/enums/verification_status.dart';

class UserModel {
  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.createdAt,
    required this.role,
    this.address,
    this.specialization,
    this.specialistCategory,
    this.yearsOfExperience,
    this.description,
    this.rating,
    this.ratingCount,
    this.ratings = const [],
    this.identityImageUrl,
    this.selfieImageUrl,
    this.verificationStatus,
    this.specialistIds = const [],
  });

  final String uid;
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final DateTime createdAt;
  final UserRole role;
  final String? address;
  final String? specialization;
  // The specialist's category key (matches CategoryModel.nameKey), selected
  // during specialist signup; only meaningful for role == specialist.
  final String? specialistCategory;
  final int? yearsOfExperience;
  final String? description;
  // average of all ratings received, only meaningful for role == specialist.
  final double? rating;
  final int? ratingCount;
  final List<RatingModel> ratings;
  // Identity/selfie verification photos, only meaningful for role ==
  // specialist; null until the specialist signup doc-upload step runs.
  final String? identityImageUrl;
  final String? selfieImageUrl;
  // Only meaningful for role == specialist; null until the specialist
  // completes the signup doc-upload step, then set to pending.
  final VerificationStatus? verificationStatus;
  // Only meaningful for role == user; the uids of every specialist this user
  // has booked. Appended to (deduplicated) each time a booking is created.
  final List<String> specialistIds;

  // password is owned by Firebase Auth, never persisted to the Firestore
  // profile document.
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt.toIso8601String(),
      'role': role.name,
      'address': address,
      'specialization': specialization,
      'specialistCategory': specialistCategory,
      'yearsOfExperience': yearsOfExperience,
      'description': description,
      'rating': rating,
      'ratingCount': ratingCount,
      'ratings': ratings.map((r) => r.toMap()).toList(),
      'identityImageUrl': identityImageUrl,
      'selfieImageUrl': selfieImageUrl,
      'verificationStatus': verificationStatus?.name,
      'specialistIds': specialistIds,
    };
  }

  UserModel copyWith({
    String? name,
    String? address,
    String? specialization,
    String? specialistCategory,
    int? yearsOfExperience,
    String? description,
    String? identityImageUrl,
    String? selfieImageUrl,
    VerificationStatus? verificationStatus,
    List<String>? specialistIds,
  }) {
    return UserModel(
      uid: uid,
      name: name ?? this.name,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      createdAt: createdAt,
      role: role,
      address: address ?? this.address,
      specialization: specialization ?? this.specialization,
      specialistCategory: specialistCategory ?? this.specialistCategory,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      description: description ?? this.description,
      rating: rating,
      ratingCount: ratingCount,
      ratings: ratings,
      identityImageUrl: identityImageUrl ?? this.identityImageUrl,
      selfieImageUrl: selfieImageUrl ?? this.selfieImageUrl,
      verificationStatus: verificationStatus ?? this.verificationStatus,
      specialistIds: specialistIds ?? this.specialistIds,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      password: '',
      createdAt: DateTime.parse(map['createdAt'] as String),
      role: UserRole.values.byName(map['role'] as String),
      address: map['address'] as String?,
      specialization: map['specialization'] as String?,
      specialistCategory: map['specialistCategory'] as String?,
      yearsOfExperience: map['yearsOfExperience'] as int?,
      description: map['description'] as String?,
      rating: (map['rating'] as num?)?.toDouble(),
      ratingCount: map['ratingCount'] as int?,
      ratings:
          (map['ratings'] as List<dynamic>?)
              ?.map((r) => RatingModel.fromMap(r as Map<String, dynamic>))
              .toList() ??
          const [],
      identityImageUrl: map['identityImageUrl'] as String?,
      selfieImageUrl: map['selfieImageUrl'] as String?,
      verificationStatus: map['verificationStatus'] != null
          ? VerificationStatus.values.byName(
              map['verificationStatus'] as String,
            )
          : null,
      specialistIds:
          (map['specialistIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );
  }
}
