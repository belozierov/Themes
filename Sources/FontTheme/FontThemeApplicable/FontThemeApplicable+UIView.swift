//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 09.03.2021.
//

#if canImport(UIKit)

import UIKit

extension UILabel: FontThemeApplicable {
	
	func setFontTheme(_ theme: FontTheme) {
		setFontTheme(theme, for: &font)
	}
	
}

extension UITextField: FontThemeApplicable {
	
	func setFontTheme(_ theme: FontTheme) {
		setFontTheme(theme, for: &font)
	}
	
}

extension UITextView: FontThemeApplicable {
	
	func setFontTheme(_ theme: FontTheme) {
		setFontTheme(theme, for: &font)
	}
	
}

#endif
