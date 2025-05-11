import Foundation
import SwiftUI

extension Color {
    
    static let instance = ColorTheme()
    
}

struct ColorTheme {
    let bottomBarActive = Color(hex: "478B40")
    let bottomBarNotActive = Color(hex: "999999")
    let greenButton = Color(hex: "478B40")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}
