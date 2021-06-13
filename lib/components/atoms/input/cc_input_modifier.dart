import 'package:cpuccino_ui/components/atoms/input/cc_input.dart';

/**
 * [CCInputModifier] contains style overloads for [CCInput]
 */
enum CCInputModifier {
  /** [CCInputModifier.shapeRounded] applies rounded corners to the input */
  shapeRounded,

  /** [CCInputModifier.shapeSquare] applies square corners to the input */
  shapeSquare,

  /** [CCInputModifier.sizeSmall] small sized input */
  sizeSmall,

  /** [CCInputModifier.sizeMedium] medium sized input */
  sizeMedium,

  /** [CCInputModifier.sizeLarge] large sized input */
  sizeLarge,

  /** [CCInputModifier.typeSolid] input with a background and no border */
  typeSolid,

  /** [CCInputModifier.typeOutline] input with a border and no background */
  typeOutline,

  /** [CCInputModifier.disabled] disabled checkbox state */
  disabled,
}
