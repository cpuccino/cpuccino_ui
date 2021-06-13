import 'package:flutter/material.dart';
import 'package:cpuccino_ui/configurations/cc_typography_configuration.dart';
import 'package:cpuccino_ui/components/atoms/typography/cc_typography_modifier.dart';

class CCTypography extends StatelessWidget {
  final Widget? icon;
  final String text;
  final Color color;

  final bool showDivider;
  final double? dividerWidth;

  final List<CCTypographyModifier> modifiers;

  CCTypography({
    this.icon,
    this.text = '',
    this.color = const Color(0xFF575757),
    this.showDivider = false,
    this.dividerWidth,
    this.modifiers = const [],
  });

  double _getFontSize() {
    if (modifiers.contains(CCTypographyModifier.t1)) return CCTypographyConfiguration.FONT_SIZE_T1;
    if (modifiers.contains(CCTypographyModifier.t2)) return CCTypographyConfiguration.FONT_SIZE_T2;
    if (modifiers.contains(CCTypographyModifier.t3)) return CCTypographyConfiguration.FONT_SIZE_T3;
    if (modifiers.contains(CCTypographyModifier.t5)) return CCTypographyConfiguration.FONT_SIZE_T5;
    if (modifiers.contains(CCTypographyModifier.t6)) return CCTypographyConfiguration.FONT_SIZE_T6;

    return CCTypographyConfiguration.FONT_SIZE_T4;
  }

  Widget _buildText(double fontSize) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          letterSpacing: 0.3,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDivider(double fontSize) {
    return Container(
      width: dividerWidth,
      height: fontSize / 5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var fontSize = _getFontSize();

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon ?? Container(),
              if (icon != null) SizedBox(width: 5),
              _buildText(fontSize),
            ],
          ),
          if (showDivider) _buildDivider(fontSize),
        ],
      ),
    );
  }
}
