import 'package:bank_simulator/core/utilities/styles_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TypeFavoritesButton extends StatelessWidget {
  final String svgPath;
  final String title;
  const TypeFavoritesButton(
      {super.key, required this.svgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            height: 66,
            width: 66,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(229, 229, 229, 0.2),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                height: 40,
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(52, 108, 189, 1),
                  BlendMode.srcIn,
                ),
                svgPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              title,
              style: textBlackButton,
            ),
          )
        ],
      ),
    );
  }
}
