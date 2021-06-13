import 'package:cpuccino_ui/components/atoms/checkbox/cc_checkbox_modifier.dart';
import 'package:cpuccino_ui/configurations/cc_checkbox_configuration.dart';
import 'package:flutter/material.dart';

class CCCheckbox extends StatelessWidget {
  final Color includeBgColor;
  final Color includeBorderColor;
  final Color excludeBgColor;
  final Color excludeBorderColor;
  final Color emptyBgColor;
  final Color emptyBorderColor;

  final VoidCallback? onTap;

  final List<CCCheckboxModifier> modifiers;

  CCCheckbox({
    this.includeBgColor = const Color(0xFF3498FF),
    this.includeBorderColor = const Color(0xFF3498FF),
    this.excludeBgColor = const Color(0xFFFC4242),
    this.excludeBorderColor = const Color(0xFFFC4242),
    this.emptyBgColor = const Color(0xFFFFFFFF),
    this.emptyBorderColor = const Color(0xFFD9D9D9),
    this.onTap,
    this.modifiers = const [],
  });

  Color _getBgColor() {
    var include = modifiers.contains(CCCheckboxModifier.include);
    var exclude = modifiers.contains(CCCheckboxModifier.exclude);
    var disabled = modifiers.contains(CCCheckboxModifier.disabled);

    if (include) return includeBgColor.withOpacity(disabled ? 0.6 : 1);
    if (exclude) return excludeBgColor.withOpacity(disabled ? 0.6 : 1);

    return disabled ? Color(0xFFEDEDF5) : emptyBgColor;
  }

  Color _getBorderColor() {
    var include = modifiers.contains(CCCheckboxModifier.include);
    var exclude = modifiers.contains(CCCheckboxModifier.exclude);
    var disabled = modifiers.contains(CCCheckboxModifier.disabled);

    if (include) return includeBorderColor.withOpacity(disabled ? 0 : 1);
    if (exclude) return excludeBorderColor.withOpacity(disabled ? 0 : 1);

    return disabled ? Color(0xFFEDEDF5) : emptyBorderColor;
  }

  double _getBorderRadius() {
    if (modifiers.contains(CCCheckboxModifier.shapeSquare)) return 0;
    if (modifiers.contains(CCCheckboxModifier.shapeCircular)) return 100;

    return 5;
  }

  BoxDecoration _getDecoration() {
    var borderColor = _getBorderColor();
    var bgColor = _getBgColor();
    var borderRadius = _getBorderRadius();

    return BoxDecoration(
      color: bgColor,
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  Widget _getIcon() {
    IconData? iconData;
    var iconSize = _getSize() * 0.8;

    if (modifiers.contains(CCCheckboxModifier.include)) iconData = Icons.check_rounded;
    if (modifiers.contains(CCCheckboxModifier.exclude)) iconData = Icons.remove_rounded;

    var emptyIcon = Container(width: iconSize, height: iconSize);
    var icon = Icon(iconData, color: Colors.white, size: iconSize);

    return iconData != null ? icon : emptyIcon;
  }

  double _getSize() {
    if (modifiers.contains(CCCheckboxModifier.sizeSmall)) return CCCheckboxConfiguration.SIZE_SMALL;
    if (modifiers.contains(CCCheckboxModifier.sizeLarge)) return CCCheckboxConfiguration.SIZE_LARGE;

    return CCCheckboxConfiguration.SIZE_MEDIUM;
  }

  @override
  Widget build(BuildContext context) {
    var enabled = !modifiers.contains(CCCheckboxModifier.disabled);
    var size = _getSize();

    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: size,
        height: size,
        decoration: _getDecoration(),
        child: _getIcon(),
      ),
    );
  }
}
