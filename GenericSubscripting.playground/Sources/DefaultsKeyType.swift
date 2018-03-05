import Foundation

/*
 A protocol to represent what a UserDefaults key must entail.
 */
public protocol DefaultsKeyType {
    
    var userDefaultsKey: UserDefaultsKey { get }
    
}

public extension DefaultsKeyType {
    
    // A helper computed property so we don't have to access the rawValue when
    var key: String {
        return userDefaultsKey.rawValue
    }
    
}
