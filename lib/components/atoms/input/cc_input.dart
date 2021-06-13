import 'package:flutter/material.dart';
import 'package:cpuccino_ui/components/atoms/input/cc_input_modifier.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CCInput extends HookWidget {
  final String? hintText;
  final Widget? suffix;

  final Color color;
  final Color bgColor;
  final Color borderColor;
  final Color focusBorderColor;
  final Color cursorColor;
  final Color clearColor;

  final TextEditingController? controller;
  final TextInputType? inputType;

  final List<CCInputModifier> modifiers;

  CCInput({
    this.hintText,
    this.suffix,
    this.color = const Color(0xFF575757),
    this.bgColor = Colors.white,
    this.borderColor = const Color(0xFFE5E5EA),
    this.focusBorderColor = const Color(0xFF3498FF),
    this.cursorColor = const Color(0xFF3498FF),
    this.clearColor = const Color(0xFFB3B3B7),
    this.controller,
    this.inputType,
    this.modifiers = const [],
  });

  Color _getBgColor() {
    var disabled = modifiers.contains(CCInputModifier.disabled);
    return disabled ? Color(0xFFF7F7FA) : bgColor;
  }

  Color _getBorderColor() {
    var outline = modifiers.contains(CCInputModifier.typeOutline);
    var disabled = modifiers.contains(CCInputModifier.disabled);

    if (outline) return disabled ? Color(0xFFE5E5EA) : borderColor;
    return disabled ? Color(0xFFF7F7FA) : bgColor;
  }

  double _getBorderRadius() {
    var rounded = modifiers.contains(CCInputModifier.shapeRounded);
    return rounded ? 6 : 0;
  }

  InputDecoration _getTextFieldDecoration() {
    var bgColor = _getBgColor();
    var borderRadius = _getBorderRadius();
    var borderColor = _getBorderColor();

    var contentPadding = EdgeInsets.only(top: 8, right: 25, bottom: 8, left: 10);

    return InputDecoration(
      isDense: true,
      hintText: hintText,
      filled: true,
      fillColor: bgColor,
      focusColor: bgColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: focusBorderColor),
      ),
      contentPadding: contentPadding,
      hintStyle: TextStyle(color: color.withOpacity(0.4)),
    );
  }

  Widget _buildTextField(ValueNotifier<String> inputValueNotifier) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        onChanged: (value) => inputValueNotifier.value = value,
        style: TextStyle(color: color, fontSize: 12),
        decoration: _getTextFieldDecoration(),
        cursorColor: cursorColor,
      ),
    );
  }

  Widget _buildClear(ValueNotifier<String> inputValueNotifier) {
    return GestureDetector(
      onTap: () {
        controller?.text = '';
        inputValueNotifier.value = '';
      },
      child: Icon(
        Icons.close,
        size: 15,
        color: clearColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var inputValueNotifier = useState(controller?.text ?? '');

    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(children: [_buildTextField(inputValueNotifier)]),
          if (inputValueNotifier.value.isNotEmpty)
            Positioned(
              right: 8,
              child: _buildClear(inputValueNotifier),
            )
        ],
      ),
    );
  }
}
