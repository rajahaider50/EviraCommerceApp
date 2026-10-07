import 'package:equatable/equatable.dart';
import 'package:evira_e_commerce/core/services/social_auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

part 'social_auth_state.dart';

@injectable
class SocialAuthCubit extends Cubit<SocialAuthState> {
  final SocialAuthService socialAuthService;
  SocialAuthCubit(this.socialAuthService) : super(SocialAuthInitial());

  Future<void> signInWithGoogle() async {
    emit(GoogleAuthLoading());
    try {
      await socialAuthService.signInWithGoogle();
      emit(GoogleAuthSuccess());
    } on GoogleSignInException catch (e) {
      if (e.code.name == 'canceled') {
        emit(GoogleAuthCanceled());
      } else {
        emit(GoogleAuthFailure(message: e.toString()));
      }
    } catch (e) {
      final msg = e.toString();
      if (msg.contains('canceled') || msg.contains('cancelled')) {
        emit(GoogleAuthCanceled());
      } else {
        emit(GoogleAuthFailure(message: msg));
      }
    }
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await socialAuthService.signOut();
      emit(SignOutSuccess());
    } catch (e) {
      emit(SignOutFailure(message: e.toString()));
    }
  }
}
