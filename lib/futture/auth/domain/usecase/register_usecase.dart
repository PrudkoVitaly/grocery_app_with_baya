import '../repositories/auth_repositories.dart';

class RegisterUseCase {
  final AuthRepositories _authRepositories;

  RegisterUseCase(this._authRepositories);

  Future<bool> call(String email, String password, String phone) {
    return _authRepositories.register(email, password, phone);
  }
}
