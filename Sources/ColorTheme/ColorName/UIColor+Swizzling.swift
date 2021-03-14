//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 09.03.2021.
//

#if canImport(UIKit)

import UIKit
import Shared

extension UIColor {
	
	private static var decoderInitIsSwizzled = false
	
	static func swizzleDecoderInit() {
		guard !decoderInitIsSwizzled else { return }
		decoderInitIsSwizzled = true
		
		exchangeSelectors(originalSelector: #selector(UIColor.init(coder:)),
						  swizzledSelector: #selector(UIColor.init(myCoder:)))
	}
	
	@objc private convenience init(myCoder aDecoder: NSCoder) {
		if let name = aDecoder.decodeObject(of: NSString.self, forKey: "UIDynamicCatalogName") {
			if let color = ColorTheme.shared?.preparedColor(with: name) {
				self.init(cgColor: color)
			} else {
				self.init(myCoder: aDecoder)
			}
			cgColor._colorName = name
		} else {
			self.init(myCoder: aDecoder)
		}
	}
	
}

extension CGColor {
	
	private static let colorName = ObjectAssociation<NSString>()
	
	fileprivate var _colorName: NSString? {
		get { Self.colorName[self] }
		set { Self.colorName[self] = newValue }
	}
	
	/// Can be used for debugging.
	public var colorName: ColorTheme.ColorName? {
		_colorName.map { .init(rawValue: $0 as String) }
	}
	
}

fileprivate extension ColorTheme {
	
	func preparedColor(with name: NSString) -> CGColor? {
		// Get color by name
		guard let color = self[.init(rawValue: name as String)]?.cgColor else { return nil }
		// Create color copy with custom color space to make it unique
		guard let colorSpace = CGColorSpace.custom else { return color }
		return color.converted(to: colorSpace, intent: .defaultIntent, options: nil) ?? color
	}
	
}

fileprivate extension CGColorSpace {
	
	/// Copy of RGB color space.
	static let custom: CGColorSpace? = {
		CGColorSpaceCreateDeviceRGB().copyPropertyList()
			.flatMap { CGColorSpace(propertyListPlist: $0) }
	}()
	
}

#endif
