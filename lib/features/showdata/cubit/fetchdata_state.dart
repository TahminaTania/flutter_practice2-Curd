part of 'fetchdata_cubit.dart';

abstract class FetchdataState extends Equatable {
  const FetchdataState();

  @override
  List<Object> get props => [];
}

class FetchdataInitial extends FetchdataState {}

class dataLoadingState extends FetchdataState {
  // @override
  // List<Object?> get props => [];
}

class dataLoadedState extends FetchdataState {
  final List<UserModel> dataCollections;
  dataLoadedState(this.dataCollections);

  // @override
  // List<Object?> get props => [todos];
}

class dataErrorState extends FetchdataState {
  final String error;
  dataErrorState(this.error);
  // @override
  // List<Object?> get props => [error];
}
