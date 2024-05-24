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

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  Future<void> _loadUserData() async {
    await UserFirabaseService().getUser();
    setState(() {
      userName = UserFirabaseService().currentUser!.name;
    });
  }

  Future<List<CardCredit>> _loadCardsCredit() async {
    var cardCredit = await CardFirebaseService().getCard();
    return cardCredit;
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
              FutureBuilder<List<CardCredit>>(
                future: _loadCardsCredit(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading cards'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No cards available'));
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: snapshot.data!.map((cardCredit) {
                          return CardCreditComponent(
                            cardCredit: cardCredit,
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
