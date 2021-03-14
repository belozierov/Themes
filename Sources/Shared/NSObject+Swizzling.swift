//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 11.03.2021.
//

import Foundation

extension NSObjectProtocol {
	
	public static func exchangeSelectors(originalSelector: Selector, swizzledSelector: Selector) {
		guard let initMethod = class_getInstanceMethod(self, originalSelector),
			  let myInitMethod = class_getInstanceMethod(self, swizzledSelector) else { return }
		
		method_exchangeImplementations(initMethod, myInitMethod)
	}
	
}
