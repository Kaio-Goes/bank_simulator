import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarComponent extends StatelessWidget {
  const BottomBarComponent({Key? key}) : super(key: key);

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
            offset: Offset(0, -4), // Sombras na parte superior
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
          type: BottomNavigationBarType.fixed, // Define o tipo como fixed
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          selectedItemColor: Colors.blue, // alterei para a cor azul padrão
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey, // alterei para a cor cinza padrão
          iconSize: 24, // ajuste o tamanho do ícone conforme necessário
          selectedFontSize: 12, // ajuste o tamanho do texto selecionado
          selectedIconTheme:
              IconThemeData(size: 15), // ajuste o tamanho do ícone selecionado
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
                'assets/images/document.svg',
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
                'assets/images/shop.svg',
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
