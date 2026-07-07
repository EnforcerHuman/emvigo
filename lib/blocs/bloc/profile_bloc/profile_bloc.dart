import 'package:bloc/bloc.dart';
import 'package:machine_task/controllers/storage_controller.dart';
import 'package:machine_task/models/user_profile_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final StorageController _storageController;

  ProfileBloc({required StorageController storageController})
    : _storageController = storageController,
      super(ProfileInitial()) {
    on<StoreProfileDataEvent>((event, emit) async {
      emit(ProfileLoading());
      final success = await _storageController.storeData(event.userProfile);
      if (success) {
        emit(ProfileSuccess(message: 'Profile saved successfully'));
      } else {
        emit(ProfileFailure(error: 'Failed to save profile'));
      }
    });

    on<GetProfileDataEvent>((event, emit) async {
      emit(ProfileLoading());
      final profile = await _storageController.getData();
      if (profile != null) {
        emit(ProfileLoaded(userProfile: profile));
      } else {
        emit(ProfileInitial());
      }
    });

    on<UpdateProfileDataEvent>((event, emit) async {
      emit(ProfileLoading());
      final success = await _storageController.updateData(event.userProfile);
      if (success) {
        emit(ProfileSuccess(message: 'Profile updated successfully'));
      } else {
        emit(ProfileFailure(error: 'Failed to update profile'));
      }
    });

    on<DeleteProfileDataEvent>((event, emit) async {
      emit(ProfileLoading());
      final success = await _storageController.deleteData();
      if (success) {
        emit(ProfileSuccess(message: 'Profile deleted successfully'));
      } else {
        emit(ProfileFailure(error: 'Failed to delete profile'));
      }
    });
  }
}
