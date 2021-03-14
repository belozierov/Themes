//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 11.03.2021.
//

#if canImport(UIKit)

import UIKit

class _ColorTheme: NSObject {
	
	let colorTheme: ColorTheme
	
	init(colorTheme: ColorTheme) {
		self.colorTheme = colorTheme
	}
	
	func apply(for color: UnsafeMutablePointer<UIColor?>) {
		guard let colorName = color.pointee?.cgColor.colorName,
			  let newColor = colorTheme[colorName] else { return }
		color.pointee = newColor
	}
	
}

#endif
