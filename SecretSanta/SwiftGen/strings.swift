// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Adicione um Participante
  internal static let addParticipantsTitle = L10n.tr("Localizable", "addParticipantsTitle")
  /// Crie sua conta
  internal static let createAccount = L10n.tr("Localizable", "createAccount")
  /// Crie sua conta
  internal static let createUserLoginTitle = L10n.tr("Localizable", "createUserLoginTitle")
  /// Não possui login?
  internal static let dontHaveLogin = L10n.tr("Localizable", "dontHaveLogin")
  /// E-mail
  internal static let email = L10n.tr("Localizable", "email")
  /// Entrar
  internal static let enter = L10n.tr("Localizable", "enter")
  /// Entre Agora
  internal static let enterNow = L10n.tr("Localizable", "enterNow")
  /// Entrar com o Facebook
  internal static let enterWithFacebook = L10n.tr("Localizable", "enterWithFacebook")
  /// Entrar com o Google
  internal static let enterWithGoogle = L10n.tr("Localizable", "enterWithGoogle")
  /// Esqueci minha senha
  internal static let forgotPassword = L10n.tr("Localizable", "forgotPassword")
  /// Toque no + para criar um novo grupo\ndo Secret Santa
  internal static let instructions = L10n.tr("Localizable", "instructions")
  /// Ou entre com:
  internal static let orLoginWith = L10n.tr("Localizable", "orLoginWith")
  /// Participantes
  internal static let participantsScreenTitle = L10n.tr("Localizable", "participantsScreenTitle")
  /// Senha
  internal static let password = L10n.tr("Localizable", "password")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
