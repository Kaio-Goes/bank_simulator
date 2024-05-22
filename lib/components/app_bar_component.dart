import 'package:bank_simulator/core/utilities/styles_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

appBarComponent() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: Stack(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: IconButton(
              icon: iconMenu,
              onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Olá,', style: textTitle),
                        Text('Cliente', style: textBoldTitle)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: SvgPicture.asset(
                      'assets/images/iconChat.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  IconButton(onPressed: () {}, icon: iconNotification)
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 0,
          child: Container(
            height: 1,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
