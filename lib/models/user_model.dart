class UserModel {
  int id;
  String fullName;
  String countryCode;
  String phoneNumber;
  String emailAddress;
  String password;


  static UserModel? user;


  UserModel({
    required this.id,
    required this.fullName,
    required this.countryCode,
    required this.phoneNumber,
    required this.emailAddress,
    required this.password,
  });
}
