import 'package:bank_simulator/core/utilities/styles_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui';

appBarComponent(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Stack(
          children: [
            AppBar(
              title: Transform.translate(
                offset: const Offset(0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Olá, ', style: textTitle),
                    Text(title, style: textBoldTitle)
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(top: 4, left: 4),
                child: IconButton(
                  icon: iconMenu,
                  onPressed: () {},
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        height: 30,
                        'assets/images/iconChat.svg',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(
                        height: 30,
                        'assets/images/notification.svg',
                        fit: BoxFit.cover,
                      ),
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
                color: colorWhiteTransparent,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
