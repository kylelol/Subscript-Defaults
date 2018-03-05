//:  # Generic Subscripting:

/*:
 ## What is a subscript?
 - Enable you to query instances of a type by writing one or more values in square brackets after the instance name
 */

class FollowerController {
    
    var followers: [String: Bool] = [:]
    
    subscript(username: String) -> Bool {
        get {
            // return an appropriate subscript value here
            return followers[username] ?? false
        }
        set(newValue) {
            // perform a suitable setting action here
            if newValue {
                followers[username] = newValue
            } else {
                followers[username] = nil
            }
        }
    }
    
    init(followers: [String: Bool]) {
        self.followers = followers
    }
    
}

//: ### Usage
let followerController = FollowerController(followers: ["kyle": true, "dan": true,  "ben": true])

let isFollowingKyle = followerController["kyle"]
followerController["steve"] = true

//: [Next](@next)
