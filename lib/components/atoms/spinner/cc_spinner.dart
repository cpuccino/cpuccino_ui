import 'package:cpuccino_ui/components/atoms/spinner/cc_spinner_modifier.dart';
import 'package:cpuccino_ui/configurations/cc_input_configuration.dart';
import 'package:cpuccino_ui/configurations/cc_spinner_configuration.dart';
import 'package:flutter/material.dart';

class CCSpinner extends StatelessWidget {
  final double strokeWidth;

  final Color spinnerColor;
  final Color spinnerBg;

  final List<CCSpinnerModifier> modifiers;

  CCSpinner({
    this.strokeWidth = 1.5,
    this.spinnerColor = const Color(0xFFF8F8FB),
    this.spinnerBg = const Color(0xFFA6A6A6),
    this.modifiers = const [],
  });

  double _getSize() {
    if (modifiers.contains(CCSpinnerModifier.sizeSmall)) return CCSpinnerConfiguration.SIZE_SMALL;
    if (modifiers.contains(CCSpinnerModifier.sizeLarge)) return CCSpinnerConfiguration.SIZE_LARGE;

    return CCSpinnerConfiguration.SIZE_MEDIUM;
  }

  @override
  Widget build(BuildContext context) {
    var size = _getSize();

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          CircularProgressIndicator(
            strokeWidth: strokeWidth,
            color: spinnerBg,
            value: 1,
          ),
          CircularProgressIndicator(
            strokeWidth: strokeWidth,
            color: spinnerColor,
          ),
        ],
      ),
    );
  }
}
