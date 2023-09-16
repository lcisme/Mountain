import 'package:equatable/equatable.dart';
import '../models/welcome_model.dart';

abstract class CubitStates extends Equatable {}
class LoadingState extends CubitStates {
  @override
// TODO: implement props
  List<Object> get props => [];

}

class WelcomeLoadedState extends CubitStates {
  WelcomeLoadedState({required this.welcomes});
  final List<WelcomeModel> welcomes;
  @override
  // TODO: implement props
  List<Object> get props => [welcomes];
}