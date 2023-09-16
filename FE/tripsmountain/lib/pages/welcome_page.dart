import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripsmountain/core/constant/color_palette.dart';
import 'package:tripsmountain/core/constant/dimension_constant.dart';
import 'package:tripsmountain/pages/main_page.dart';
import 'package:tripsmountain/services/cubit/app_cubit.dart';
import 'package:tripsmountain/states/cubit_state.dart';
import 'package:tripsmountain/widgets/app_text.dart';
import 'package:tripsmountain/widgets/button_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    context.read<AppCubits>().loadWelcomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<AppCubits, CubitStates>(
            builder: (context, state) {
              if (state is WelcomeLoadedState) {
                var welcome = state.welcomes;
                return Stack(
                  children: [
                    PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: welcome.length,
                      itemBuilder: (context, index) {
                        return Container(
                          //set full screen
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(welcome[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 190,
                              left: kDefaultPadding,
                              right: kDefaultPadding,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: welcome[index].title,
                                      size: 38,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    AppText(
                                      text: welcome[index].subTitle,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 306,
                                      child: AppText(
                                        text: welcome[index].description,
                                        size: 16,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 48,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                         Navigator.of(context).pushNamed(MainPage.routeName);
                                        // BlocProvider.of<AppCubits>(context).getAllDestination();
                                      },
                                      child: ButtonNext(
                                        width: 100,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: List.generate(3, (indexDots) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 2),
                                      width: 8,
                                      height: index == indexDots ? 25 : 12,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: index == indexDots
                                            ? ColorPalette.primaryColor
                                            : ColorPalette.primaryColor.withOpacity(0.5),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        // Add any widgets you want to display at the bottom of the screen
                      ),
                    ),
                  ],
                );
              }
              return Container(child: Text("error"));
            },
          ),
        ),
      ),
    );
  }
}