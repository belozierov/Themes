//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 09.03.2021.
//

#if canImport(UIKit)

import UIKit

protocol FontThemeApplicable: class {
	
	func setFontTheme(_ theme: FontTheme)
	
}

extension FontThemeApplicable {
	
	func setFontTheme(_ theme: FontTheme, for font: UnsafeMutablePointer<UIFont?>) {
		guard let newFont = font.pointee?.fontName.flatMap({ theme[$0] }) else { return }
		font.pointee = newFont
	}
	
}

#endif



