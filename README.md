# Generic Subscripting with UserDefaults
This repo is from a talk I gave at the Orlando iOS Devs meetup in February '18. It shows how you can use Generic Subscripting the make UserDefaults type safe.

Example: 

```swift
// The old way of doing things 

UserDefaults.standard.setValue(true, forKey: "seenTutorial")
let seenTutorial = UserDefaults.standard.value(forKey: "seenTutorial")
let seenTutorialBool = UserDefaults.standard.bool(forKey: "seenTutorial")
```

Turn the old way using UserDefaults into this: 

```swift
// boolValue is now of type 'Bool'. No need to case or worry about optionals.
let boolValue = UserDefaults.standard[.boolKey]

UserDefaults.standard[.intKey] = 10
let intValue = UserDefaults.standard[.intKey]
print(intValue) // 10

UserDefaults.standard[.stringKey] = "test"
let stringValue = UserDefaults.standard[.stringKey]
print(stringValue) // "test"
```

## To Do
1. Expand the UserDefaults subscript to handle complex objects that require a dictionary to represent them. 
2. Expand the UserDefaults subscript to support optional values. 
