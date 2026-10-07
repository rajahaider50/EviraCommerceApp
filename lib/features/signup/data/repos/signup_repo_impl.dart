import 'package:evira_e_commerce/features/signup/domain/entities/signup_entity.dart';
import 'package:evira_e_commerce/features/signup/domain/repos/signup_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: SignupRepo)
class SignupRepoImpl implements SignupRepo {
  final supabase = Supabase.instance.client;

  @override
  Future<bool> signup({required SignupEntity signupEntity}) async {
    AuthResponse response = await supabase.auth.signUp(
      email: signupEntity.email,
      password: signupEntity.password,
    );

    if (response.user != null) {
      return true;
    }
    return false;
  }
}
