// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Experience a variaty of amazing dishes from different cultures around the world.
  internal static let descriptionSlide1 = L10n.tr("Localizable", "description_slide_1", fallback: "Experience a variaty of amazing dishes from different cultures around the world.")
  /// Our dishes are prepared by only the best.
  internal static let descriptionSlide2 = L10n.tr("Localizable", "description_slide_2", fallback: "Our dishes are prepared by only the best.")
  /// Your order will be delivered instantly irrespective of your location around the world.
  internal static let descriptionSlide3 = L10n.tr("Localizable", "description_slide_3", fallback: "Your order will be delivered instantly irrespective of your location around the world.")
  /// Localizable.strings
  ///   Yummy_App
  /// 
  ///   Created by Ismayil Ismayilov on 20.02.23.
  internal static let titleNextButton = L10n.tr("Localizable", "title_next_button", fallback: "Next")
  /// Get Started
  internal static let titleNextButtonDidSet = L10n.tr("Localizable", "title_next_button_did_set", fallback: "Get Started")
  /// Delicious dishes
  internal static let titleSlide1 = L10n.tr("Localizable", "title_slide_1", fallback: "Delicious dishes")
  /// World-Class chefs
  internal static let titleSlide2 = L10n.tr("Localizable", "title_slide_2", fallback: "World-Class chefs")
  /// Instant Worldwide Delivery
  internal static let titleSlide3 = L10n.tr("Localizable", "title_slide_3", fallback: "Instant Worldwide Delivery")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
