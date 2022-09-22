import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_market/database/fake_database.dart';
import 'package:grocery_market/route.dart';
import 'package:like_button/like_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            FontAwesomeIcons.bars,
            color: Color(0xff5B4F4A),
          ),
        ),
        title: Row(
          children: [
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(),
              child: ActionChip(
                elevation: 2,
                backgroundColor: const Color(0xff5B4F4A),
                label: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 20,
                ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          elevation: 10,
          onPressed: () {},
          backgroundColor: const Color(0xff4c424b),
          child: const FaIcon(FontAwesomeIcons.barcode),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: FaIcon(FontAwesomeIcons.bell)),
              label: ""),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.cartPlus), label: ""),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user), label: ""),
        ],
      ),
      body: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: const [
          Positioned(
            top: 10,
            left: 0,
            child: _Title(),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: double.minPositive,
            child: _Categories(),
          ),
          Positioned(
            top: 180,
            left: 0,
            bottom: double.minPositive,
            right: double.minPositive,
            child: _ItemsList(),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi Rahim!",
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          "want to order delicious food?",
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              "see All",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.redAccent),
            )
          ],
        ),
        SizedBox(
          height: double.minPositive + 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (String item in categories)
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: ChoiceChip(
                      selectedColor: Colors.red,
                      side: const BorderSide(),
                      disabledColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      labelStyle: Theme.of(context).textTheme.caption?.copyWith(
                          color: getLabelStyle(item),
                          fontStyle: FontStyle.italic),
                      label: Text(item),
                      selected: item == "All",
                    ))
            ],
          ),
        )
      ],
    );
  }

  Color getLabelStyle(String item) {
    if (item == "All") {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}

class _ItemsList extends StatelessWidget {
  const _ItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var numberOfRow = height ~/ 300;
    print(height);
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          radius: 1.5,
          colors: [
            Color(0xffEAE8DB),
            Colors.white,
          ],
        ),
      ),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.3, crossAxisCount: numberOfRow),
        scrollDirection: Axis.horizontal,
        children: [
          for (String key in list.keys)
            Padding(
              padding: const EdgeInsets.all(5),
              child: SellItems(
                name: key,
                price: (Random().nextInt(30) + 3).toString(),
                imageAsset: list[key]!,
              ),
            )
        ],
      ),
    );
  }
}

class SellItems extends StatelessWidget {
  final String name;
  final String price;
  final String imageAsset;
  const SellItems(
      {Key? key,
      required this.name,
      required this.price,
      required this.imageAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: name,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(MyRoute.detail);
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(imageAsset),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    name,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: price,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.red),
                            children: [
                              TextSpan(
                                text: "/kg",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                              ),
                            ]),
                      ),
                      const LikeButton()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
