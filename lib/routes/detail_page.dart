import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_market/widgets/change_cart.dart';
import 'package:grocery_market/widgets/price_tag.dart';
import 'package:like_button/like_button.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String imageAsset;
  final String price;
  const DetailPage(
      {Key? key,
      required this.name,
      required this.imageAsset,
      required this.price})
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
      body: _DetailPageBody(
        name: name,
        imageAsset: imageAsset,
        price: price,
      ),
    );
  }
}

class _DetailPageBody extends StatelessWidget {
  final String name;
  final String imageAsset;
  final String price;
  const _DetailPageBody(
      {Key? key,
      required this.name,
      required this.imageAsset,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: _Title(
            name: name,
          ),
        ),
        Positioned(
          top: 60,
          left: 0,
          right: double.minPositive,
          child: _Pic(
            imageAsset: imageAsset,
            name: name,
          ),
        ),
        Positioned(
          top: 320,
          left: 0,
          right: double.minPositive,
          child: _Description(
            price: price,
          ),
        ),
        const Positioned(bottom: 60, left: 0, right: 0, child: AddCartButton())
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String name;
  const _Title({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            name,
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
  final String imageAsset;
  final String name;
  const _Pic({Key? key, required this.imageAsset, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: Hero(
          tag: name,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1),
            child: Image.asset(imageAsset),
          )),
    );
  }
}

class _Description extends StatelessWidget {
  final String price;
  const _Description({Key? key, required this.price}) : super(key: key);

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
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceTag(
                  price: price,
                  fontWeight: FontWeight.w900,
                ),
                const SizedBox(
                  width: 130,
                  height: 40,
                  child: ChangeCart(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AddCartButton extends StatelessWidget {
  const AddCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff5B4F4A),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Text(
          "Add to Cart",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
