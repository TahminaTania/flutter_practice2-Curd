import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_p2/features/showdata/model/usermode.dart';
import 'package:flutter_p2/features/showdata/repo/repository.dart';

part 'fetchdata_state.dart';

class FetchdataCubit extends Cubit<FetchdataState> {
  final UserRepository _repository;
  FetchdataCubit(this._repository) : super(FetchdataInitial());

  Future<void> fetchdata() async {
    emit(dataLoadingState());
    await Future.delayed(Duration(seconds: 2));
    try {
      final response = await _repository.getdata();
      emit(dataLoadedState(response));
    } catch (e) {
      emit(dataErrorState(e.toString()));
    }
  }
}
