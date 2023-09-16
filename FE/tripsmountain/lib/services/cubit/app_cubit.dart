import 'package:bloc/bloc.dart';
import 'package:tripsmountain/services/authentication_service.dart';
import 'package:tripsmountain/services/data_service.dart';
import 'package:tripsmountain/states/cubit_state.dart';
import 'package:tripsmountain/states/initial_state.dart';

import '../../models/place_model.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.dataServices, required this.authService}): super(InitialState()) {
    loadWelcomePage();
  }
  final DataServices dataServices;
  final AuthenticationService authService;

  var destinations;
  late List<PlaceModel> places;
  late List<PlaceModel> favoritePlaces = [];
  var welcome;
  var userModel;
// welcome page
  void loadWelcomePage() async {
    try {
      emit(LoadingState());
      welcome = await dataServices.welcome();
      emit(WelcomeLoadedState(welcomes: welcome));
    } catch (e) {
      print(e);
    }
  }
}