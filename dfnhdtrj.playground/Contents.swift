//: Playground - noun: a place where people can play

import UIKit

enum JSONType {
    case JSONNumber(NSNumber)
    case JSONString(String)
    case JSONBool(Bool)
    case JSONNull
    case JSONArray(Array<JSONType>)
    case JSONObject(Dictionary<String,JSONType>)
    case JSONInvalid(NSError)
}

protocol StructDecoder {
}

struct Media : StructDecoder {
    var name : String = ""
    var desc : String?
    var category : Int = 0
    var width : Int = 0
    var height : Int = 0
    var imageUrl : String = ""
}

//extension Media : JSONDecodable{
//
//}

/** Allows to extend functionality to several APIs that ends on the same resulting object.
 *
 */
protocol JSONParselable {
}


enum MediaAPIType : APIType {
    case Media
    
    var notCommonKeys : Dictionary<String, String> {
        switch self {
        case .Media:
            return ["desc":"description"]
        }
    }
}

protocol APIType {}

protocol JSONDecodable {
    var notCommonKeys : Dictionary<String, String> { get }
}

enum SerializableError : ErrorType {
    case KeyNotFound(String)
}

extension JSONDecodable {
    static func decode(json: [String:AnyObject]) throws -> [Self] {
        do {
            let mirror = Mirror(reflecting: self.dynamicType)
            print(mirror.children)
            var dict : [String: AnyObject] = [:]
            print(mirror.children.count)
            for case let (label?, value) in mirror.children {
                print(value)
                
//                if (dict[label] == nil) { throw SerializableError.KeyNotFound("") }
                
                dict[label] = value as? AnyObject
//                do {
//                    print(value)
//                } catch {
//                    
//                }
            }
            
            return []
        } catch _ {
            //            throw SerializationError.StructRequired
            return []
        }
    }
    
//    static func decode(json: [String:AnyObject], Par) throws -> [Self]  {
//        return []
//    }
}

let a : [String:AnyObject] = ["name": "Orange or lemon", "description": "",  "category": (0 as Int), "width": (472 as Int), "height": (709 as Int),"image_url": "http://pcdn.500px.net/4910421/c4a10b46e857e33ed2df35749858a7e45690dae7/2.jpg"]
//let media : [Media] = try! Media.decode(a)


