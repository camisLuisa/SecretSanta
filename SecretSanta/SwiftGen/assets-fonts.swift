// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length
// swiftlint:disable implicit_return

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum Quicksand {
    internal static let light = FontConvertible(name: "Quicksand-Light", family: "Quicksand", path: "QuicksandVariableFontwght.ttf")
    internal static let bold = FontConvertible(name: "Quicksand-Light_Bold", family: "Quicksand", path: "QuicksandVariableFontwght.ttf")
    internal static let medium = FontConvertible(name: "Quicksand-Light_Medium", family: "Quicksand", path: "QuicksandVariableFontwght.ttf")
    internal static let regular = FontConvertible(name: "Quicksand-Light_Regular", family: "Quicksand", path: "QuicksandVariableFontwght.ttf")
    internal static let all: [FontConvertible] = [light, bold, medium, regular]
  }
  internal enum Roboto {
    internal static let regular = FontConvertible(name: "Roboto-Regular", family: "Roboto", path: "Roboto-Regular.ttf")
    internal static let all: [FontConvertible] = [regular]
  }
  internal enum SegoeUI {
    internal static let regular = FontConvertible(name: "SegoeUI", family: "Segoe UI", path: "SegoeUI.ttf")
    internal static let bold = FontConvertible(name: "SegoeUI-Bold", family: "Segoe UI", path: "SegoeUIBold.ttf")
    internal static let boldItalic = FontConvertible(name: "SegoeUI-BoldItalic", family: "Segoe UI", path: "SegoeUIBoldItalic.ttf")
    internal static let italic = FontConvertible(name: "SegoeUI-Italic", family: "Segoe UI", path: "SegoeUIItalic.ttf")
    internal static let all: [FontConvertible] = [regular, bold, boldItalic, italic]
  }
  internal static let allCustomFonts: [FontConvertible] = [Quicksand.all, Roboto.all, SegoeUI.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(OSX)
  internal typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Font = UIFont
  #endif

  internal func font(size: CGFloat) -> Font! {
    return Font(font: self, size: size)
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
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
