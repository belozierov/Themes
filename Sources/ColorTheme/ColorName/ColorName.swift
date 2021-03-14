//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 09.03.2021.
//

#if canImport(UIKit)

extension ColorTheme {
	
	public struct ColorName: Hashable, RawRepresentable {
		
		public let rawValue: String
		
		public init(rawValue: String) {
			self.rawValue = rawValue
		}
		
	}
	
}

extension ColorTheme.ColorName: ExpressibleByStringLiteral {
	
	public init(stringLiteral value: String) {
		rawValue = value
	}
	
}

#endif
