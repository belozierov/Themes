//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 14.03.2021.
//

#if canImport(UIKit)

import UIKit
import Shared

extension UIView {
	
	private static var colorAssetsFixed = false
	
	// This workaround only for iOS 11 and 12 to fix bug with colors from assets
	static func fixBugWithColorAssets() {
		if #available(iOS 13, *) { return }
		
		guard !colorAssetsFixed else { return }
		colorAssetsFixed = true
		
		exchangeSelectors(originalSelector: Selector(("_uikit_applyValueFromTraitStorage:forKeyPath:")),
						  swizzledSelector: #selector(applyValueFromStorage(_:forKeyPath:)))
	}
	
	@objc private func applyValueFromStorage(_ a: Any, forKeyPath b: Any) {
		if a is UIColor { return }
		applyValueFromStorage(a, forKeyPath: b)
	}
	
}

#endif
