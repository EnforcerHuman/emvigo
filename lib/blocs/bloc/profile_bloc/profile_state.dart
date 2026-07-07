part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserProfileModel userProfile;

  ProfileLoaded({required this.userProfile});
}

final class ProfileSuccess extends ProfileState {
  final String message;

  ProfileSuccess({required this.message});
}

final class ProfileFailure extends ProfileState {
  final String error;
  ProfileFailure({required this.error});
}
