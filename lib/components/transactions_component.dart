import 'package:bank_simulator/core/models/card_credit.dart';
import 'package:bank_simulator/core/models/card_transactions.dart';
import 'package:bank_simulator/core/utilities/styles_constants.dart';
import 'package:bank_simulator/core/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionsComponent extends StatefulWidget {
  final bool isCardTransactions;
  final Future<List<CardTransactions>> Function(String id) getTransactions;
  final List<CardCredit> cardsCredit;

  const TransactionsComponent(
      {super.key,
      required this.isCardTransactions,
      required this.getTransactions,
      required this.cardsCredit});

  @override
  State<TransactionsComponent> createState() => _TransactionsComponentState();
}

class _TransactionsComponentState extends State<TransactionsComponent> {
  late Future<List<CardTransactions>> _transactionsFuture;

  Future<void> _loadTransactions() async {
    String id = widget.isCardTransactions
        ? widget.cardsCredit.last.id
        : widget.cardsCredit.first.id;
    setState(() {
      _transactionsFuture = widget.getTransactions(id);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  @override
  void didUpdateWidget(covariant TransactionsComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCardTransactions != widget.isCardTransactions) {
      _loadTransactions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Últimos lançamentos',
                style: textBlack,
              ),
              Row(
                children: [
                  Text(
                    'Ver todos',
                    style: textBlackLight,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: colorBlueShape,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.31,
          width: double.infinity,
          child: FutureBuilder(
            future: _transactionsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error loading cards'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No cards available'));
              } else {
                // Ordenar as transações pela data em ordem decrescente
                List<CardTransactions> transactions = snapshot.data!;
                transactions.sort((a, b) => b.startDate.compareTo(a.startDate));

                // Agrupar as transações pelo dia
                Map<String, List<CardTransactions>> groupedTransactions = {};
                for (var transaction in transactions) {
                  String date = formatDate(transaction.startDate);
                  if (!groupedTransactions.containsKey(date)) {
                    groupedTransactions[date] = [];
                  }
                  groupedTransactions[date]!.add(transaction);
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: groupedTransactions.entries.map(
                      (entry) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 9),
                              child: Text(
                                entry.key,
                                style: textBlueTitle,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: entry.value.map((transaction) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Stack(
                                        children: [
                                          if (transaction.id == "2" ||
                                              transaction.id == "9")
                                            Positioned(
                                              top: 5,
                                              left: 50,
                                              child: SvgPicture.asset(
                                                height: 20,
                                                'assets/images/attencion.svg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ListTile(
                                            leading: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                  color: colorWhiteTransparent2,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(12))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    height: 30,
                                                    transaction.type == "shop"
                                                        ? 'assets/images/shopping.svg'
                                                        : transaction.type ==
                                                                "travel"
                                                            ? "assets/images/car.svg"
                                                            : 'assets/images/mobile.svg',
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                      Color.fromRGBO(
                                                          60, 106, 178, 1),
                                                      BlendMode.srcIn,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  transaction.name,
                                                  style: textLabelBlack,
                                                ),
                                                Text(
                                                  getFormattedBalance(
                                                      transaction.price),
                                                  style: textLabelBlack,
                                                )
                                              ],
                                            ),
                                            subtitle: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  formatDateHour(
                                                      transaction.startDate),
                                                  style: textLabel,
                                                ),
                                                Text(
                                                    transaction.installmentPayment
                                                                .toString() ==
                                                            "1"
                                                        ? ""
                                                        : "em ${transaction.installmentPayment.toString()}x",
                                                    style: textLabelLight)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      color: colorWhiteTransparent,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 2),
                                    )
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
