class UserProfileModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String dob;
  final String gender;
  final String country;
  final String language;

  UserProfileModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.country,
    required this.language,
  });

  UserProfileModel.fromJson(Map<String, dynamic> json, {this.id})
    : firstName = json['firstName'] ?? '',
      lastName = json['lastName'] ?? '',
      dob = json['dob'] ?? '',
      gender = json['gender'] ?? '',
      country = json['country'] ?? '',
      language = json['language'] ?? '';

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'gender': gender,
      'country': country,
      'language': language,
    };
  }
}
