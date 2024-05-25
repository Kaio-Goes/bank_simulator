import 'package:bank_simulator/core/models/card_credit.dart';
import 'package:bank_simulator/core/utilities/styles_constants.dart';
import 'package:bank_simulator/core/utilities/utils.dart';
import 'package:flutter/material.dart';

class CardCreditComponent extends StatefulWidget {
  final CardCredit cardCredit;
  const CardCreditComponent({super.key, required this.cardCredit});

  @override
  State<CardCreditComponent> createState() => _CardCreditComponentState();
}

class _CardCreditComponentState extends State<CardCreditComponent> {
  bool _isMasked = true;

  void toggleMask() {
    setState(() {
      _isMasked = !_isMasked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 330,
        height: 160,
        decoration: BoxDecoration(
            gradient: widget.cardCredit.id == '1' ? colorCard : colorCard2,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                width: 88,
                height: 65,
                color: const Color.fromRGBO(217, 217, 217, 1),
              ),
            ),
            Positioned(
              top: 25,
              left: 120,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getMaskedCardNumber(widget.cardCredit.number),
                        style: textNumberCard,
                      ),
                      Text(
                        widget.cardCredit.name,
                        style: textLight,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: toggleMask,
                    icon: Icon(
                      _isMasked
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 60,
              left: 15,
              right: 0,
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                    gradient: widget.cardCredit.id == "1"
                        ? colorGradientWhite
                        : colorGradientWhite2),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Limite disponível',
                        style: textLabelCard,
                      ),
                      _isMasked
                          ? Text(
                              getFormattedBalance(
                                  widget.cardCredit.availableBalance),
                              style: textNumberCard,
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.8, bottom: 8.8),
                              child: Container(
                                height: 6,
                                width: 100,
                                color: Colors.white,
                              ),
                            )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Melhor dia de compra',
                        style: textLabelCard,
                      ),
                      Text(
                        widget.cardCredit.paymentDueDate.toString(),
                        style: textNumberCard,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
