import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarComponent extends StatelessWidget {
  const BottomBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, -4),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          iconSize: 24,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/Home.svg',
                fit: BoxFit.cover,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/shop.svg',
                fit: BoxFit.cover,
              ),
              label: 'Faturas',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/bankCard.svg',
                fit: BoxFit.cover,
              ),
              label: 'Cartão',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                height: 27,
                'assets/images/document.svg',
                fit: BoxFit.cover,
              ),
              label: 'Shop',
            ),
          ],
        ),
      ),
    );
  }
}
