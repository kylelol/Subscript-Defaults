import Foundation

/*
 - A struct that represents a key to access a value in UserDefaults. It is generic so you can define the type
 of value you would like to store for that given key.
 - The corresponding keys to use in the subscript are defind as static computer properties.
 - We provide a defaultValue so you don't have to worry about optionals
 */
public struct DefaultsKey<Type>: DefaultsKeyType {
    public let userDefaultsKey: UserDefaultsKey
    public let defaultValue: Type
    
    init(userDefaultsKey: UserDefaultsKey, defaultValue: Type) {
        self.userDefaultsKey = userDefaultsKey
        self.defaultValue = defaultValue
    }
    
    /*
     - The actual keys you will use to get into UserDefaults will be defined as static computed properties
     - This allows you to know the type associated to your key, as well as use type inference when subscripting
     into UserDefaults.
     */
    
    public static var boolKey: DefaultsKey<Bool> {
        return DefaultsKey<Bool>(userDefaultsKey: .boolKey, defaultValue: false)
    }
    
    public static var intKey: DefaultsKey<Int> {
        return DefaultsKey<Int>(userDefaultsKey: .intKey, defaultValue: 0)
    }

    public static var stringKey: DefaultsKey<String> {
        return DefaultsKey<String>(userDefaultsKey: .stringKey, defaultValue: "")
    }

    public static var stringEnumKey: DefaultsKey<StringEnum> {
        return DefaultsKey<StringEnum>(userDefaultsKey: .enumStringKey, defaultValue: .one)
    }
    
    public static var uuidKey: DefaultsKey<UUID> {
        return DefaultsKey<UUID>(userDefaultsKey: .uuidKey, defaultValue: UUID())
    }

}
