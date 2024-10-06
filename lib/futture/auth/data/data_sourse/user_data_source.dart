class UserDataSource {
  final List<Map<String, String>> _users = [
    {
      "email": "pZL1g@example.com",
      "password": "123",
      "phone": "000",
    },
    {
      "email": "pZL2g@example.com",
      "password": "456",
      "phone": "000",
    },
    {
      "email": "pZL3g@example.com",
      "password": "789",
      "phone": "000",
    },
  ];

  Future<bool> authenticate(String email, String password) async {
    return _users.any((element) =>
        element["email"] == email && element["password"] == password);
  }

  Future<bool> userExists(String email) async {
    return _users.any((element) => element["email"] == email);
  }

  Future<bool> register(
      String email, String password, String phone) async {
    if (await userExists(email)) {
      return false;
    }
    _users
        .add({"email": email, "password": password, "phone": phone});
    print(_users);
    return true;
  }
}
