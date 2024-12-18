import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/profile/domain/repository/profile_repository.dart';
import 'package:social_media/features/profile/presentation/cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileLoading());

  Future<void> fetchUserProfile(String uid) async {
    try {
      final user = await profileRepo.fetchUserProfile(uid);

      if (user != null) {
        emit(ProfileLoaded(user));
      } else {
        emit(ProfileError('Пользователь не найден'));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  // обноить профиль пользователя
  Future<void> updateProfile({
    required String uid,
    String? newBio,
  }) async {
    try {
      final currentUser = await profileRepo.fetchUserProfile(uid);

      if (currentUser == null) {
        emit(ProfileError('Пользователь не найден'));
        return;
      }

      // обновление профиля
      final updatedProfile =
          currentUser.copyWith(newBio: newBio ?? currentUser.bio);
      await profileRepo.updateProfile(updatedProfile);

      await fetchUserProfile(uid);
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
