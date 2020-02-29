//
//  Person.swift
//  covid19
//
//  Created by Jaron Schreiber on 2/28/20.
//  Copyright © 2020 jaron. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol DocumentSerializable {
    init?(dictionary:[String:Any])
}

struct Person {
    var name: String
    var age: Int
    var location: Location
    var timeStamp: Date
    
    var dictionary:[String: Any] {
        return [
            "name": name,
            "age": age,
            "location": location,
            "timeStamp": timeStamp
        ]
    }
}

struct Location {
    var coordinate: Coordinate
}

struct Coordinate {
    var latitude: Double
    var longitude: Double
}

extension Person: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
            let age = dictionary["age"] as? Int,
            let location = dictionary["location"] as? Location,
            let timeStamp = dictionary["timeStamp"] as? Date else { return nil }
        
        self.init(name: name, age: age, location: location, timeStamp: timeStamp)
    }
    
    
}
