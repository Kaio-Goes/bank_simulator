import 'package:bank_simulator/components/app_bar_component.dart';
import 'package:bank_simulator/components/card_credit_component.dart';
import 'package:bank_simulator/core/models/card_credit.dart';
import 'package:bank_simulator/service/card/card_firebase_service.dart';
import 'package:bank_simulator/service/user/user_firabase_service.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String userName = "Cliente";
  List<CardCredit> cardsCredit = [];

  @override
  void initState() {
    _loadUserData();
    CardFirebaseService().getCard();
    setState(() {
      cardsCredit = CardFirebaseService.cards;
    });
    super.initState();
  }

  @override
  void dispose() {
    cardsCredit.clear();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    await UserFirabaseService().getUser();
    setState(() {
      userName = UserFirabaseService().currentUser!.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(userName),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  Color.fromRGBO(60, 106, 178, 1),
                  Color.fromRGBO(255, 255, 255, 1),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ...cardsCredit.map((cardCredit) {
                          return CardCreditComponent(
                            cardCredit: cardCredit,
                          );
                        })
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
