import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  String price;
  FontWeight fontWeight;
  PriceTag({Key? key, required this.price, this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "\$$price",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.red, fontWeight: fontWeight),
          children: [
            TextSpan(
              text: "/kg",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black.withOpacity(0.5),
                  ),
            ),
          ]),
    );
  }
}
