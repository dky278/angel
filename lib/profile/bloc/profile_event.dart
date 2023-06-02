part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}
class ProfileInitialEvent extends ProfileEvent {}

class ProfileSubscriptionNavigateEvent extends ProfileEvent{}

class NavigateToeditprofilePageEvent extends ProfileEvent {}
class NavigatetoSubscriptionPageEvent extends ProfileEvent {}
