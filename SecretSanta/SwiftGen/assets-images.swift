// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let add = ImageAsset(name: "add")
  internal static let cancelRed = ImageAsset(name: "cancel_red")
  internal static let close = ImageAsset(name: "close")
  internal static let delete = ImageAsset(name: "delete")
  internal static let ellipseOne = ImageAsset(name: "ellipse-one")
  internal static let gift = ImageAsset(name: "gift")
  internal static let groupTitle = ImageAsset(name: "group_title")
  internal static let idIcon = ImageAsset(name: "id_icon")
  internal static let line = ImageAsset(name: "line")
  internal static let logoAmiguSecreto = ImageAsset(name: "logo_amigu_secreto")
  internal static let logoAmiguSecretoSplash = ImageAsset(name: "logo_amigu_secreto_splash")
  internal static let logoSecretSanta = ImageAsset(name: "logo_secret_santa")
  internal static let lu = ImageAsset(name: "lu")
  internal static let passwordIcon = ImageAsset(name: "password_icon")
  internal static let plus = ImageAsset(name: "plus")
  internal static let step1 = ImageAsset(name: "step1")
  internal static let step2 = ImageAsset(name: "step2")
  internal static let step3 = ImageAsset(name: "step3")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
