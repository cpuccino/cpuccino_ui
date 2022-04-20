import 'package:cpuccino_ui/components/atoms/spinner/cc_spinner.dart';
import 'package:cpuccino_ui/components/atoms/spinner/cc_spinner_modifier.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: CCSpinner(
          modifiers: [CCSpinnerModifier.sizeLarge],
        ),
      ),
    );
  }
}
