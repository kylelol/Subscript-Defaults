/*:
 ## Making User Defaults Type Safe for primitives
 */

import Foundation
import UIKit

// Current way of using UserDefaults
UserDefaults.standard.setValue(true, forKey: "seenTutorial")
let seenTutorial = UserDefaults.standard.value(forKey: "seenTutorial")
let seenTutorialBool = UserDefaults.standard.bool(forKey: "seenTutorial")


/*
 Generic Subscripts with UserDefaults
 
  This is where the magic happens. We constrain the generic `Type` to UserDefaultable to allow only the types we say into
   UserDefaults.
 */
extension UserDefaults {
    
    subscript<Type: UserDefaultable>(defaultsKey: DefaultsKey<Type>) -> Type {
        get {
            
            return object(forKey: defaultsKey.key) as? Type ?? defaultsKey.defaultValue
        }
        set {
            set(newValue, forKey: defaultsKey.key)
        }
    }
    
}

// The benefit here is that now you cannot assign any value other than a boolean to the key 'boolKey'
UserDefaults.standard[.boolKey] = true

// boolValue is now of type 'Bool'. No need to case or worry about optionals.
let boolValue = UserDefaults.standard[.boolKey]

UserDefaults.standard[.intKey] = 10
let intValue = UserDefaults.standard[.intKey]

UserDefaults.standard[.stringKey] = "test"
let stringValue = UserDefaults.standard[.stringKey]

//: [Next](@next)
