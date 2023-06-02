part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

abstract class ProfileActionState extends ProfileState{}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedSuccessState extends ProfileState{}

class ProfileErrorState extends ProfileState{ }

class NavigatetoSubscriptionPageState extends ProfileState{}

class NavigateToeditprofilePageActionState extends ProfileActionState {}


