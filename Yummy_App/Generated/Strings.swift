// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Something
  internal static let something = L10n.tr("Localizable", "something", fallback: "Something")
  /// Third page
  internal static let thirdPage = L10n.tr("Localizable", "third_page", fallback: "Third page")
  /// Localizable.strings
  ///   Yummy_App
  /// 
  ///   Created by Ismayil Ismayilov on 20.02.23.
  internal static let titleHomePage = L10n.tr("Localizable", "title_home_page", fallback: "Home page")
  /// Second page
  internal static let titleSecondPage = L10n.tr("Localizable", "title_second_page", fallback: "Second page")
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