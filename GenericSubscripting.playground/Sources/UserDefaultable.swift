import Foundation

/*
 An empty protocol to constrain what types we want to allow to go into UserDefaults
 Typcially this would be any primitive type. Complex types will be explained below.
 */
public protocol UserDefaultable { }
extension Bool: UserDefaultable { }
extension Int: UserDefaultable { }
extension String: UserDefaultable { }
