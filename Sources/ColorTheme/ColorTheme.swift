//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 09.03.2021.
//

#if canImport(UIKit)

import UIKit

public struct ColorTheme {
	
	public static var shared: ColorTheme? {
		didSet { launchForIBObjects() }
	}
	
	public static func launchForIBObjects() {
		UIColor.swizzleDecoderInit()
		UIView.fixBugWithColorAssets()
	}
	
	private let colorNames: [ColorName: UIColor]
	
	public subscript(name: ColorName) -> UIColor? {
		colorNames[name]
	}
	
}

extension ColorTheme: ExpressibleByDictionaryLiteral {
	
	public init(dictionaryLiteral elements: (ColorName, UIColor)...) {
		self.colorNames = Dictionary(uniqueKeysWithValues: elements)
	}
	
}

extension UIColor {
	
	public typealias Theme = ColorTheme
	
}

extension UIView {
	
	public func applyColorThemeToIBObjects(_ colorTheme: ColorTheme) {
		setColorTheme(_ColorTheme(colorTheme: colorTheme))
	}
	
}

#endif
