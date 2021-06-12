import 'package:flutter/material.dart';
import 'package:cpuccino_ui/configurations/cc_typography_configuration.dart';
import 'package:cpuccino_ui/components/atoms/typography/cc_typography_modifier.dart';

class CCTypography extends StatelessWidget {
  final String _text;
  final Widget? _icon;

  final bool _showDivider;
  final double _dividerWidth;
  final Alignment _dividerAlignment;

  final Color _color;
  final List<CCTypographyModifier> _modifiers;

  CCTypography({
    required String text,
    Widget? icon,
    bool showDivider = false,
    double? dividerWidth,
    Alignment dividerAlignment = Alignment.center,
    List<CCTypographyModifier> modifiers = const [
      CCTypographyModifier.t4,
    ],
    Color color = const Color(0xFF575757),
  })  : _text = text,
        _icon = icon,
        _showDivider = showDivider,
        _dividerWidth = dividerWidth = 50.0,
        _dividerAlignment = dividerAlignment,
        _modifiers = modifiers,
        _color = color;

  double _getFontSize() {
    if (_modifiers.contains(CCTypographyModifier.t1)) return CCTypographyConfiguration.T1_FONT_SIZE;
    if (_modifiers.contains(CCTypographyModifier.t2)) return CCTypographyConfiguration.T2_FONT_SIZE;
    if (_modifiers.contains(CCTypographyModifier.t3)) return CCTypographyConfiguration.T3_FONT_SIZE;
    if (_modifiers.contains(CCTypographyModifier.t5)) return CCTypographyConfiguration.T5_FONT_SIZE;
    if (_modifiers.contains(CCTypographyModifier.t6)) return CCTypographyConfiguration.T6_FONT_SIZE;

    return CCTypographyConfiguration.T4_FONT_SIZE;
  }

  Widget _buildText() {
    var fontSize = _getFontSize();

    return Expanded(
      child: Text(
        _text,
        style: TextStyle(
          color: _color,
          fontSize: fontSize,
          letterSpacing: 0.3,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    var fontSize = _getFontSize();

    return _showDivider
        ? Container(
            margin: EdgeInsets.only(top: 3, bottom: 3),
            alignment: _dividerAlignment,
            child: Container(
              width: _dividerWidth,
              height: fontSize / 5,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _icon ?? Container(),
              _icon != null ? SizedBox(width: 10) : Container(),
              _buildText(),
            ],
          ),
          _buildDivider(),
        ],
      ),
    );
  }
}
