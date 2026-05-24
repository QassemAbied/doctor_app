class SignUpParams {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String? image;
  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.image,
  });
}

class SignInParams {
  final String email;
  final String password;
  SignInParams({
    required this.email,
    required this.password,

  });
}

class UpdateUserParams {
  final String name;
  final String email;
  final String phone;
  final String? image;

  UpdateUserParams({
    required this.name,
    required this.email,
    required this.phone,
    this.image,
  });
}