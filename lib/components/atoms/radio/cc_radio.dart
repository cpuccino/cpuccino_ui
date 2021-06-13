import 'package:cpuccino_ui/components/atoms/radio/cc_radio_modifier.dart';
import 'package:flutter/material.dart';

class CCRadio extends StatelessWidget {
  final Color filledBgColor;
  final Color filledBorderColor;
  final Color emptyBgColor;
  final Color emptyBorderColor;
  final Color fillColor;

  final VoidCallback? onTap;

  final List<CCRadioModifier> modifiers;

  CCRadio({
    this.filledBgColor = const Color(0xFF3498FF),
    this.filledBorderColor = const Color(0xFF3498FF),
    this.emptyBgColor = const Color(0xFFFFFFFF),
    this.emptyBorderColor = const Color(0xFFD9D9D9),
    this.fillColor = Colors.white,
    this.onTap,
    this.modifiers = const [],
  });

  Color _getBgColor() {
    var filled = modifiers.contains(CCRadioModifier.filled);
    var disabled = modifiers.contains(CCRadioModifier.disabled);

    if (filled) return filledBgColor.withOpacity(disabled ? 0.6 : 1);

    return disabled ? Color(0xFFEDEDF5) : emptyBgColor;
  }

  Color _getBorderColor() {
    var empty = modifiers.contains(CCRadioModifier.empty);
    var filled = modifiers.contains(CCRadioModifier.filled);
    var disabled = modifiers.contains(CCRadioModifier.disabled);

    if (empty) return emptyBorderColor.withOpacity(disabled ? 0 : 1);
    if (filled) return filledBorderColor.withOpacity(disabled ? 0 : 1);

    return disabled ? Color(0xFFEDEDF5) : emptyBorderColor;
  }

  BoxDecoration _getFillDecoration() {
    return BoxDecoration(
      color: fillColor,
      border: Border.all(color: fillColor),
      borderRadius: BorderRadius.circular(100),
    );
  }

  BoxDecoration _getDecoration() {
    var borderColor = _getBorderColor();
    var bgColor = _getBgColor();

    return BoxDecoration(
      color: bgColor,
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(100),
    );
  }

  Widget _buildFill() {
    return Center(
      child: Container(
        width: 6,
        height: 6,
        decoration: _getFillDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var filled = modifiers.contains(CCRadioModifier.filled);
    var enabled = !modifiers.contains(CCRadioModifier.disabled);

    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 16,
        height: 16,
        decoration: _getDecoration(),
        child: filled ? _buildFill() : Container(),
      ),
    );
  }
}
