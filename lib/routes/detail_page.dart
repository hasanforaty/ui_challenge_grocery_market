import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String imageAsset;
  const DetailPage({Key? key, required this.name, required this.imageAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(),
              child: ActionChip(
                elevation: 2,
                backgroundColor: const Color(0xff5B4F4A),
                label: const FaIcon(
                  Icons.more_vert_sharp,
                  size: 30,
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
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black.withOpacity(0.7),
          size: 40,
        ),
      ),
      body: _DetailPageBody(),
    );
  }
}

class _DetailPageBody extends StatelessWidget {
  const _DetailPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned(
          top: 0,
          left: 0,
          child: _Title(),
        ),
        Positioned(
          top: 60,
          left: 0,
          right: double.minPositive,
          child: _Pic(),
        ),
        Positioned(
          top: 320,
          left: 0,
          right: double.minPositive,
          child: _Description(),
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Orance",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            "with us",
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}

class _Pic extends StatelessWidget {
  const _Pic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "Orange",
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1),
          child: Image.asset("images/orange.jpg"),
        ));
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Description",
                style: Theme.of(context).textTheme.headline6,
              ),
              const LikeButton()
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40, top: 10),
            child: RichText(
              text: TextSpan(
                  text:
                      "orance is so healthy food fro humen body so we need to take food and also supprtb food items then we deserve that fress food this food is so heavy quality and dinamic food.....",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black.withOpacity(0.7),
                      ),
                  children: [
                    TextSpan(
                        text: "See More",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold))
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Total Price",
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
