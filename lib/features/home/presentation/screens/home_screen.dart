import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).appTitle)),
      body: Center(child: Text(S.of(context).welcomeMessage)),
    );
  }
}
