import 'package:cpuccino_ui/components/atoms/checkbox/cc_checkbox.dart';

/**
 * [CCCheckboxModifier] contains style overloads for [CCCheckbox]
 */
enum CCCheckboxModifier {
  /** [CCCheckboxModifier.shapeRounded] applies rounded corners to the checkbox */
  shapeRounded,

  /** [CCCheckboxModifier.shapeCircular] applies circular shape to the checkbox */
  shapeCircular,

  /** [CCCheckboxModifier.shapeSquare] applies square corners to the checkbox */
  shapeSquare,

  /** [CCCheckboxModifier.sizeSmall] small sized checkbox */
  sizeSmall,

  /** [CCCheckboxModifier.sizeMedium] medium sized checkbox */
  sizeMedium,

  /** [CCCheckboxModifier.sizeLarge] large sized checkbox */
  sizeLarge,

  /** [CCCheckboxModifier.empty] empty checkbox state */
  empty,

  /** [CCCheckboxModifier.include] checked checkbox state */
  include,

  /** [CCCheckboxModifier.exclude] excluded checkbox state */
  exclude,

  /** [CCCheckboxModifier.disabled] disabled checkbox state */
  disabled,
}
