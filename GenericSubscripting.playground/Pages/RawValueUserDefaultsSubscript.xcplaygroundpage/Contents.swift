//: [Previous](@previous)

import Foundation

/*
 Same setup as UserDefaults file, but we constrain our generic `Type` to the RawUserRepresentable protocol.
 That way we can correclty convert the object to and from a UserDefaults acceptable type.
 */
extension UserDefaults {
    
    subscript<Type: RawUserDefaultable>(defaultsKey: DefaultsKey<Type>) -> Type {
        get {
            guard let defaultsValue = object(forKey: defaultsKey.key) as? Type.RawValue else {
                return defaultsKey.defaultValue
            }
            
            return Type.from(defaultsValue: defaultsValue) ?? defaultsKey.defaultValue
        }
        set {
            set(newValue.defaultsValue, forKey: defaultsKey.key)
        }
    }
}

/*
 String enum is defined in Sources/Models/StringEnum.swift
 
 We conform it to `RawUserDefaultable` in order to store it to user defaults
 We chose this protocol because it allows us to store something that only have 1 value to represent it.
 */
extension StringEnum: RawUserDefaultable {
    
    public var defaultsValue: String {
        return rawValue
    }
    
    public static func from(defaultsValue: String) -> StringEnum? {
        return StringEnum(rawValue: defaultsValue)
    }
    
}

/*
 We can also extend Objects as well that have only 1 value, such as a uuid.
 */
extension UUID: RawUserDefaultable {
    
    public var defaultsValue: String {
        return uuidString
    }
    
    public static func from(defaultsValue: String) -> UUID? {
        return UUID(uuidString: defaultsValue)
    }

}

UserDefaults.standard[.stringEnumKey] = .two
let stringEnum = UserDefaults.standard[.stringEnumKey]

UserDefaults.standard[.uuidKey] = UUID()
let uuid = UserDefaults.standard[.uuidKey]

//: [Next](@next)
