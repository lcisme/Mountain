import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tripsmountain/core/constant/dimension_constant.dart';
import 'package:tripsmountain/core/extention/text_style_ext.dart';
import 'package:tripsmountain/widgets/app_bar_container.dart';

import '../core/helper/ImageHelper.dart';

/*
class HomePageNew extends StatefulWidget {
const HomePageNew({super.key});

@override
State<HomePageNew> createState() => _HomePageNewState();
}
*/

class HomePageNew extends StatefulWidget {
  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  final List<Map<String,String>> listImageLeft =
  [
    {
      'name': 'Portugal',
      'image': "assets/images/portugal.png",
    },{
    'name': 'France',
    'image': "assets/images/france.png",
  },
    {
      'name': 'England',
      'image': "assets/images/england.png",
    },
    {
      'name': 'Spain',
      'image': "assets/images/spain.png",
    },
    {
      'name': 'Argentina',
      'image': "assets/images/argentina.png",
    },
    {
      'name': 'Germany',
      'image': "assets/images/germany.png",
    },
  ];

  Widget _buildImageHomScreen(String name, String image) {
    return GestureDetector(
      onTap: () {
         // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
      },
      child: Container(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ImageHelper.LoadFromAsset(
              image,
              width: double.maxFinite,
              height: 200,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(kItemPadding),
            ),
            const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: kDefaultPadding,
              bottom: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(kMinPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMinPadding),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFC107),
                        ),
                        SizedBox(
                          width: kItemPadding,
                        ),
                        Text('4.5'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  Text(
                    name,
                    style: TextStyles.defaultStyle
                        .blackTextColor
                        .bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: AppBarContainer(
            titleString: 'home',
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kItemPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi Guy! ',
                        style: TextStyles.defaultStyle.fontHeader.whiteTextColor.bold,
                      ),
                      const SizedBox(
                        height: kMediumPadding,
                      ),
                      Text(
                        'Where are you going next?',
                        style: TextStyles.defaultStyle.fontCaption.whiteTextColor,
                      )
                    ],
                  )
                ],
              ),
            ),
            implementLeading: false,
            child: Column(
              children: [
                TextField(
                  enabled: true,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Search your destination',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.black,
                        size: 14,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          kItemPadding,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
                  ),
                  style: TextStyles.defaultStyle,
                  onChanged: (value) {},
                  onSubmitted: (String submitValue) {},
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                const SizedBox(
                  height: kMediumPadding,
                ),
                Row(
                  children: [
                    Text(
                      'Popular Destinations',
                      style: TextStyles.defaultStyle.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: kMediumPadding,
                ),
                Expanded(
                    child: CustomScrollView(
                      primary: false,
                      slivers: <Widget>[
                        SliverPadding(
                          padding: const EdgeInsets.all(0),
                          sliver: SliverGrid.count(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: listImageLeft
                                .map(
                                  (e) => _buildImageHomScreen(
                                e['name']!,
                                e['image']!,
                              ),
                            ).toList(),
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}