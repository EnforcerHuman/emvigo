import 'package:bloc/bloc.dart';
import 'package:machine_task/controllers/auth_controller.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthController _firebaseAuthService;
  AuthBloc({required AuthController firebaseAuthService})
    : _firebaseAuthService = firebaseAuthService,
      super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(AuthInitial());
    });

    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        bool data = await _firebaseAuthService.signIn(
          event.email,
          event.password,
        );
        if (data) {
          emit(AuthSuccess(message: 'Sign-in successful'));
        } else {
          emit(AuthFailure(error: 'Sign-in failed'));
          return;
        }
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final data = await _firebaseAuthService.signUp(
          event.email,
          event.password,
        );
        if (!data) {
          emit(AuthFailure(error: 'Sign-up failed'));
          return;
        } else {
          emit(AuthSuccess(message: 'Sign-up successful'));
        }
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });
  }
}
