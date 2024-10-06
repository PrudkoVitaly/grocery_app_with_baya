import '../repositories/auth_repositories.dart';

class LoginUseCase {
  final AuthRepositories _authRepositories;

  LoginUseCase(this._authRepositories);

  Future<bool> call(String email, String password) {
    return _authRepositories.login(email, password);
  }
}
