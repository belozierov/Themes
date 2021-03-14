//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 06.03.2021.
//

#if canImport(UIKit)

import UIKit
import Shared

extension UIFont {
	
	private static var decoderInitIsSwizzled = false
	
	static func swizzleDecoderInit() {
		guard !decoderInitIsSwizzled else { return }
		decoderInitIsSwizzled = true
		
		exchangeSelectors(originalSelector: #selector(UIFontDescriptor.init(coder:)),
						  swizzledSelector: #selector(UIFont.init(myCoder:)))
	}
	
	@objc private convenience init(myCoder aDecoder: NSCoder) {
		guard let fontTheme = FontTheme.shared,
			  let descriptor = aDecoder.decodeObject(of: UIFontDescriptor.self, forKey: "UIFontDescriptor"),
			  let fontName = descriptor.fontAttributes[.name] as? String,
			  let font = fontTheme[.init(rawValue: fontName)]
		else {
			self.init(myCoder: aDecoder)
			return
		}
		
		self.init(descriptor: font.fontDescriptor, size: font.pointSize)
		self.fontName = .init(rawValue: fontName)
	}
	
	// MARK: - Font name
	
	private static let fontName = ObjectAssociation<NSString>()
	
	private(set) var fontName: FontTheme.FontName? {
		get { Self.fontName[self].map { .init(rawValue: $0 as String) } }
		set { Self.fontName[self] = newValue?.rawValue as NSString? }
	}
	
}

#endif
