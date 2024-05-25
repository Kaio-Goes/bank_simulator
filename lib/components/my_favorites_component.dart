import 'package:bank_simulator/components/type_favorites_button.dart';
import 'package:bank_simulator/core/utilities/styles_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyFavoritesComponent extends StatelessWidget {
  const MyFavoritesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6, left: 23, right: 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Meus favoritos', style: textBlack),
              Row(
                children: [
                  const Text('Personalizar', style: textBlackLight),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: SvgPicture.asset(
                      'assets/images/grid_view.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(top: 23, left: 35, right: 15),
            child: Row(
              children: [
                TypeFavoritesButton(
                    svgPath: 'assets/images/virtualCard.svg',
                    title: 'Cartão Virtual'),
                SizedBox(width: 30),
                TypeFavoritesButton(
                    svgPath: 'assets/images/additionalCard.svg',
                    title: 'Cartão adicional'),
                SizedBox(width: 30),
                TypeFavoritesButton(
                    svgPath: 'assets/images/segurity.svg', title: 'Seguros'),
                SizedBox(width: 30),
                TypeFavoritesButton(
                    svgPath: 'assets/images/packageSms.svg',
                    title: 'Pacote SMS'),
                SizedBox(width: 30),
                TypeFavoritesButton(
                    svgPath: 'assets/images/room.svg', title: 'Sala VIP')
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          color: colorWhiteTransparent,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        )
      ],
    );
  }
}
