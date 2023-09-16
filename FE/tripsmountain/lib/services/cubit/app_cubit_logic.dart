import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripsmountain/pages/welcome_page.dart';
import 'package:tripsmountain/states/cubit_state.dart';
import 'app_cubit.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});
  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}
class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(
            builder: (context, state) {
              if (state is WelcomeLoadedState) {
                return WelcomePage();
              }
              if (state is LoadingState) {
                return Center(
                  child: Container(color: Colors.white,
                    child: const CircularProgressIndicator(),),
                );
              }
              return Container(
                color: Colors.white,
                child: Text("no_state"),
              );
            }),
    );
  }
}