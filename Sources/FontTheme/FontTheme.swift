//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 09.03.2021.
//

#if canImport(UIKit)

import UIKit

public struct FontTheme {
	
	public static var shared: FontTheme? {
		didSet { UIFont.swizzleDecoderInit() }
	}
	
	private let fonts: [FontName: UIFont]
	
	public subscript(name: FontName) -> UIFont? {
		fonts[name]
	}
	
}

extension FontTheme: ExpressibleByDictionaryLiteral {
	
	public init(dictionaryLiteral elements: (FontName, UIFont)...) {
		fonts = Dictionary(uniqueKeysWithValues: elements)
	}
	
}

extension UIView {
	
	public func applyFontThemeToIBObjects(_ fontTheme: FontTheme) {
		(self as? FontThemeApplicable)?.setFontTheme(fontTheme)
		subviews.forEach { $0.applyFontThemeToIBObjects(fontTheme) }
	}
	
}

#endif
