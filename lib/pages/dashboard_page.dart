import 'package:bank_simulator/components/app_bar_component.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(),
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
            decoration: const BoxDecoration(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
