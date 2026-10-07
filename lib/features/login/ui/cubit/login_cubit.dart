import 'package:evira_e_commerce/core/lang_generated/l10n.dart';
import 'package:evira_e_commerce/features/login/domain/entities/login_entity.dart';
import 'package:evira_e_commerce/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit(this.loginUsecase) : super(LoginInitial());

  void login({required LoginEntity loginEntity}) async {
    emit(LoginLoading());
    try {
      await loginUsecase(loginEntity);
      emit(LoginSuccess());
    } on AuthException catch (e) {
      emit(LoginError(commonErrors(e.code ?? '', e.message)));
    } catch (e) {
      return emit(LoginError(e.toString()));
    }
  }

  String commonErrors(String code, String message) {
    switch (code) {
      case 'invalid_credentials':
      case 'invalid_grant':
        return EviraLang.current.invalid_credentials;
      case 'email_not_confirmed':
        return 'Please confirm your email address.';
      default:
        return message.isNotEmpty ? message : EviraLang.current.unknownError;
    }
  }
}
