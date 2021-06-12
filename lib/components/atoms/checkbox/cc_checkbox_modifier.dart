import 'package:cpuccino_ui/components/atoms/checkbox/cc_checkbox.dart';

/**
 * [CCCheckboxModifier] contains style overloads for [CCCheckbox]
 */
enum CCCheckboxModifier {
  /** [CCCheckboxModifier.shapeRounded] applies rounded corners to the checkbox */
  shapeRounded,

  /** [CCCheckboxModifier.shapeCircular] applies square corners to the checkbox */
  shapeCircular,

  /** [CCCheckboxModifier.shapeSquare] applies rounded corners to the checkbox */
  shapeSquare,

  /** [CCCheckboxModifier.sizeSmall] small checkbox */
  sizeSmall,

  /** [CCCheckboxModifier.sizeMedium] medium checkbox */
  sizeMedium,

  /** [CCCheckboxModifier.sizeLarge] large checkbox */
  sizeLarge,

  /** [CCCheckboxModifier.neutral] unchecked checkbox state */
  neutral,

  /** [CCCheckboxModifier.include] checked checkbox state */
  include,

  /** [CCCheckboxModifier.exclude] excluded checkbox state */
  exclude,

  /** [CCCheckboxModifier.disabled] disables the checkbox widget */
  disabled,
}
