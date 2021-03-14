//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 09.03.2021.
//

#if canImport(UIKit)

import UIKit

// Only implemented for several classes for testing

extension UIView {
	
	@objc func setColorTheme(_ theme: _ColorTheme) {
		subviews.forEach { $0.setColorTheme(theme) }
		theme.apply(for: &backgroundColor)
		theme.apply(for: &tintColor)
	}
	
}

extension UILabel {
	
	override func setColorTheme(_ theme: _ColorTheme) {
		super.setColorTheme(theme)
		theme.apply(for: &textColor)
		theme.apply(for: &shadowColor)
		theme.apply(for: &highlightedTextColor)
	}
	
}

extension UITextField {
	
	override func setColorTheme(_ theme: _ColorTheme) {
		super.setColorTheme(theme)
		theme.apply(for: &textColor)
	}
	
}

extension UITextView {
	
	override func setColorTheme(_ theme: _ColorTheme) {
		super.setColorTheme(theme)
		theme.apply(for: &textColor)
	}
	
}

extension UIButton {
	
	override func setColorTheme(_ theme: _ColorTheme) {
		super.setColorTheme(theme)
		for state in [UIControl.State.normal, .highlighted, .selected, .disabled] {
			var color = titleColor(for: state)
			theme.apply(for: &color)
			setTitleColor(color, for: state)
		}
	}
	
}

#endif
