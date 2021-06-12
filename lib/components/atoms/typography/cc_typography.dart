import 'package:flutter/material.dart';
import 'package:cpuccino_ui/configurations/cc_typography_configuration.dart';
import 'package:cpuccino_ui/components/atoms/typography/cc_typography_modifier.dart';

class CCTypography extends StatelessWidget {
  final Widget? icon;
  final String text;
  final Color color;

  final bool showDivider;

  final List<CCTypographyModifier> modifiers;

  CCTypography({
    this.icon,
    this.text = '',
    this.color = const Color(0xFF575757),
    this.showDivider = false,
    this.modifiers = const [],
  });

  double _getFontSize() {
    if (modifiers.contains(CCTypographyModifier.t1)) return CCTypographyConfiguration.T1_FONT_SIZE;
    if (modifiers.contains(CCTypographyModifier.t2)) return CCTypographyConfiguration.T2_FONT_SIZE;
    if (modifiers.contains(CCTypographyModifier.t3)) return CCTypographyConfiguration.T3_FONT_SIZE;
    if (modifiers.contains(CCTypographyModifier.t5)) return CCTypographyConfiguration.T5_FONT_SIZE;
    if (modifiers.contains(CCTypographyModifier.t6)) return CCTypographyConfiguration.T6_FONT_SIZE;

    return CCTypographyConfiguration.T4_FONT_SIZE;
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
      margin: EdgeInsets.only(top: 3, bottom: 3),
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: fontSize / 5,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var fontSize = _getFontSize();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon ?? Container(),
              icon != null ? SizedBox(width: 10) : Container(),
              _buildText(fontSize),
            ],
          ),
          showDivider ? _buildDivider(fontSize) : Container(),
        ],
      ),
    );
  }
}
