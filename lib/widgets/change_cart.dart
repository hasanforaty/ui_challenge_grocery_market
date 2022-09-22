import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangeCart extends StatefulWidget {
  const ChangeCart({Key? key}) : super(key: key);

  @override
  State<ChangeCart> createState() => _ChangeCartState();
}

class _ChangeCartState extends State<ChangeCart> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (value > 1) value--;
              });
            },
            icon: const Icon(
              FontAwesomeIcons.minus,
              size: 15,
              color: Colors.white,
            ),
          ),
          Text(
            "${value}kg",
            overflow: TextOverflow.fade,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                value++;
              });
            },
            icon: const Icon(
              Icons.add_circle_outlined,
              size: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
