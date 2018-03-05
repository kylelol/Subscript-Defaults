
/*:
 ## Generic Subscript
 */
import Foundation

/*
    With swift 4, we can now use generics in our subscripts
    Note the `Key` & `Value`
 */

class RelationshipController<Key: Hashable, Value> {
    
    var relationships: [Key: Value] = [:]
    
    subscript(id: Key) -> Value? {
        get {
            return relationships[id]
        }
        set(newValue) {
            relationships[id] = newValue
        }
    }
    
}

/*:
 ### Usage
 */

struct User {
    
    struct ID: Hashable, Equatable {
        let value: String
        
        var hashValue: Int {
            return value.hashValue
        }
        
        public static func ==(lhs: ID, rhs: ID) -> Bool {
            return lhs.value == rhs.value
        }

    }
    
    let id: ID
    let username: String
    
    init(username: String) {
        self.username = username
        self.id = ID(value: UUID().uuidString)
    }
    
}

let genericFollowerController = RelationshipController<User.ID, User>()
let kyleUser = User(username: "kyle")

genericFollowerController[kyleUser.id] = kyleUser
let isFollowingKyle = genericFollowerController[kyleUser.id]



