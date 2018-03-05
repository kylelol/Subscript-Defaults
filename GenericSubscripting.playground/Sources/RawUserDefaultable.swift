import Foundation

/*
 Conform an object to this protocol if you only have 1 value that is required to be stored into UserDefaults.
 The associated type is constrained to UserDefaultable, so we can only store the correct values into UserDefaults.
 */
public protocol RawUserDefaultable  {
    
    associatedtype RawValue: UserDefaultable
    var defaultsValue: RawValue { get }
    static func from(defaultsValue: RawValue) -> Self?
    
}


