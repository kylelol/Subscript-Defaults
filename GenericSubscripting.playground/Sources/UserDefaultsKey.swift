import Foundation

/**
 We use an enumeration to represent the string value keys that we will pass into the UserDefaults.
 */
public enum UserDefaultsKey: String {
    
    // Primitives
    case boolKey
    case intKey
    case stringKey
    
    // RawUserDefaultableboolKey
    case enumStringKey
    case uuidKey
}
