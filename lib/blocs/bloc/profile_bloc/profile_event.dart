part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class StoreProfileDataEvent extends ProfileEvent {
  final UserProfileModel userProfile;

  StoreProfileDataEvent({required this.userProfile});
}

final class GetProfileDataEvent extends ProfileEvent {}

final class UpdateProfileDataEvent extends ProfileEvent {
  final UserProfileModel userProfile;

  UpdateProfileDataEvent({required this.userProfile});
}

final class DeleteProfileDataEvent extends ProfileEvent {}
