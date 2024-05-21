import 'package:bank_simulator/core/utilities/styles_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              children: [IconButton(onPressed: () {}, icon: iconNotification)],
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
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
        child: Center(
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
