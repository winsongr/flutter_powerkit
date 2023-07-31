import 'package:flutter_powerkit/flutter_powerkit.dart';

extension ContextExtensions on BuildContext {
  /// Sizes
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  /// Colors
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get backgroundColor => Theme.of(this).colorScheme.background;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  /// TextStyles
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  /// helpers
  void hideKeyboard() => FocusScope.of(this).unfocus();

  /// Navigation
}
