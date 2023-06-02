import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileInitialEvent>(profileInitialEvent);
    on<NavigateToeditprofilePageEvent>(navigateToeditprofilePageEvent);
    on< NavigatetoSubscriptionPageEvent>( navigatetoSubscriptionPageEvent);
  }

  FutureOr<void> profileInitialEvent(
      ProfileInitialEvent event, Emitter<ProfileState> emit) {
    emit(ProfileLoadingState());
    // await Future.delayed(Duration(seconds: 3));
    emit(ProfileLoadedSuccessState());
  }

  FutureOr<void> navigateToeditprofilePageEvent(
      NavigateToeditprofilePageEvent event, Emitter<ProfileState> emit) {
    print('edit profile clicked');
    emit(NavigateToeditprofilePageActionState());
  }


  FutureOr<void> navigatetoSubscriptionPageEvent(
      NavigatetoSubscriptionPageEvent event, Emitter<ProfileState> emit) {
    print('subscription clicked');
    emit(NavigatetoSubscriptionPageState());
  }
}

