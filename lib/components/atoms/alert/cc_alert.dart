import 'package:cpuccino_ui/components/atoms/alert/cc_alert_modifier.dart';
import 'package:cpuccino_ui/configurations/cc_alert_configuration.dart';
import 'package:flutter/material.dart';

class CCAlert extends StatelessWidget {
  final List<CCAlertModifier> modifiers;

  CCAlert({
    this.modifiers = const [],
  });

  double _getBorderRadius() {
    if (modifiers.contains(CCAlertModifier.shapeSquare)) {
      return CCAlertConfiguration.BORDER_RADIUS_SQUARE;
    }

    return CCAlertConfiguration.BORDER_RADIUS_ROUNDED;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          _getBorderRadius(),
        ),
      ),
    );
  }
}
