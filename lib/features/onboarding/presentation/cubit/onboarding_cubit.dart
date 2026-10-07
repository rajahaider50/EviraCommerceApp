import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void next(int page) => emit(page);
}
