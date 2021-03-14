//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 11.03.2021.
//

extension FontTheme {
	
	public struct FontName: Hashable, RawRepresentable {
		
		public let rawValue: String
		
		public init(rawValue: String) {
			self.rawValue = rawValue
		}
		
	}
	
}

extension FontTheme.FontName: ExpressibleByStringLiteral {
	
	public init(stringLiteral value: String) {
		rawValue = value
	}
	
}
