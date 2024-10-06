import 'package:grocery_app_with_baya/futture/auth/domain/repositories/auth_repositories.dart';

import '../data_sourse/user_data_source.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final UserDataSource _userDataSource;

  AuthRepositoriesImpl(this._userDataSource);

  @override
  Future<bool> login(String email, String password) {
    return _userDataSource.authenticate(email, password);
  }

  @override
  Future<bool> register(String email, String password, String phone) {
    return _userDataSource.register(email, password, phone);
  }
}
