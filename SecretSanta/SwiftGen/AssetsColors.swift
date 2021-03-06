// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#707070"></span>
  /// Alpha: 100% <br/> (0x707070ff)
  internal static let gray1 = ColorName(rgbaValue: 0x707070ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#4b4b4b"></span>
  /// Alpha: 100% <br/> (0x4b4b4bff)
  internal static let gray3 = ColorName(rgbaValue: 0x4b4b4bff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e97e80"></span>
  /// Alpha: 100% <br/> (0xe97e80ff)
  internal static let mediumRed = ColorName(rgbaValue: 0xe97e80ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d54545"></span>
  /// Alpha: 100% <br/> (0xd54545ff)
  internal static let red1 = ColorName(rgbaValue: 0xd54545ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f4c7c8"></span>
  /// Alpha: 100% <br/> (0xf4c7c8ff)
  internal static let red2 = ColorName(rgbaValue: 0xf4c7c8ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eb5757"></span>
  /// Alpha: 100% <br/> (0xeb5757ff)
  internal static let red3 = ColorName(rgbaValue: 0xeb5757ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d38789"></span>
  /// Alpha: 100% <br/> (0xd38789ff)
  internal static let roseRed = ColorName(rgbaValue: 0xd38789ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 0% <br/> (0xffffff00)
  internal static let whiteBlur = ColorName(rgbaValue: 0xffffff00)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f5f18e"></span>
  /// Alpha: 100% <br/> (0xf5f18eff)
  internal static let appYellow = ColorName(rgbaValue: 0xf5f18eff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eff3f4"></span>
  /// Alpha: 100% <br/> (0xeff3f4ff)
  internal static let gray2 = ColorName(rgbaValue: 0xeff3f4ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#adadad"></span>
  /// Alpha: 100% <br/> (0xadadadff)
  internal static let gray4 = ColorName(rgbaValue: 0xadadadff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a9a9a9"></span>
  /// Alpha: 100% <br/> (0xa9a9a9ff)
  internal static let gray5 = ColorName(rgbaValue: 0xa9a9a9ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fffefe"></span>
  /// Alpha: 100% <br/> (0xfffefeff)
  internal static let white1 = ColorName(rgbaValue: 0xfffefeff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map {
      CGFloat($0 & 0xff)
    }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
