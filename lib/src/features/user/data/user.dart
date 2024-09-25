class UserModel {
  final String imageUrl;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String volunteerHours;
  final String volunteerCount;
  final String backingCount;

  UserModel({
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.volunteerHours,
    required this.volunteerCount,
    required this.backingCount,
  });
}
