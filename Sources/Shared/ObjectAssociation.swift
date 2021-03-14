//
//  File.swift
//  
//
//  Created by Olexandr Belozierov on 09.03.2021.
//

import Foundation

public class ObjectAssociation<T: AnyObject> {

	private let policy: objc_AssociationPolicy

	/// - Parameter policy: An association policy that will be used when linking objects.
	public init(policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
		self.policy = policy
	}

	/// Accesses associated object.
	/// - Parameter index: An object whose associated object is to be accessed.
	public subscript(index: AnyObject) -> T? {
		get { objc_getAssociatedObject(index, objectKey) as? T }
		set { objc_setAssociatedObject(index, objectKey, newValue, policy) }
	}
	
	private var objectKey: UnsafeRawPointer {
		UnsafeRawPointer(Unmanaged.passUnretained(self).toOpaque())
	}
	
}
