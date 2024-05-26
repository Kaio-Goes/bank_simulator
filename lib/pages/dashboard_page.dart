import 'package:bank_simulator/components/app_bar_component.dart';
import 'package:bank_simulator/components/card_credit_component.dart';
import 'package:bank_simulator/components/bottom_bar_component.dart';
import 'package:bank_simulator/components/my_favorites_component.dart';
import 'package:bank_simulator/components/transactions_component.dart';
import 'package:bank_simulator/core/models/card_credit.dart';
import 'package:bank_simulator/core/models/card_transactions.dart';
import 'package:bank_simulator/core/utilities/styles_constants.dart';
import 'package:bank_simulator/service/card/card_service.dart';
import 'package:bank_simulator/service/card_transactions/card_transactions_service.dart';
import 'package:bank_simulator/service/user/user_service.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String userName = "Cliente";
  List<CardCredit> cardsCredit = [];
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> isCardTransactionNotifier =
      ValueNotifier<bool>(false);
  final Map<String, List<CardTransactions>> transactionsCache = {};
  late Future<void> _initialLoad;

  @override
  void initState() {
    _loadUserData();
    _scrollController.addListener(_scrollListener);
    _initialLoad = _loadInitialData();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    isCardTransactionNotifier.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels == 0) {
        // O usuário voltou ao começo do scroll
        isCardTransactionNotifier.value = false;
      } else {
        // O usuário chegou ao final do scroll
        isCardTransactionNotifier.value = true;
      }
    }
  }

  Future<void> _loadInitialData() async {
    await _loadUserData();
    await _loadCardsCredit();
  }

  Future<void> _loadUserData() async {
    await UserService().getUser();
    setState(() {
      userName = UserService().currentUser!.name;
    });
  }

  Future<List<CardCredit>> _loadCardsCredit() async {
    cardsCredit = await CardService().getCard();
    return cardsCredit;
  }

  Future<List<CardTransactions>> getTransactions(String id) async {
    if (transactionsCache.containsKey(id)) {
      return transactionsCache[id]!;
    } else {
      var transactions =
          await CardTransactionsService().getCardTransactions(id);
      transactionsCache[id] = transactions;
      return transactions;
    }
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
            FutureBuilder<void>(
              future: _initialLoad,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading data'));
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        SizedBox(
                          height: 180,
                          child: FutureBuilder<List<CardCredit>>(
                            future: _loadCardsCredit(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return const Center(
                                    child: Text('Error loading cards'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return const Center(
                                    child: Text('No cards available'));
                              } else {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: _scrollController,
                                  child: Row(
                                    children: snapshot.data!.map((cardCredit) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: CardCreditComponent(
                                            cardCredit: cardCredit),
                                      );
                                    }).toList(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        Container(
                          height: 1,
                          color: colorWhiteTransparent,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 16),
                        ),
                        const MyFavoritesComponent(),
                        ValueListenableBuilder<bool>(
                          valueListenable: isCardTransactionNotifier,
                          builder: (context, isCardTransaction, child) {
                            return TransactionsComponent(
                              isCardTransactions: isCardTransaction,
                              getTransactions: getTransactions,
                              cardsCredit: cardsCredit,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
        bottomNavigationBar: const BottomBarComponent());
  }
}
