//
//  Student.swift
//  Students
//
//  Created by Andrew R Madsen on 8/5/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

struct Student: Codable {
    var name: String
    
    var firstName: String {
        return String(name.split(separator: " ")[0] ) //take the first element out of the array and make a string out of it
    }
    
    var lastName: String? {
        guard let result = name.split(separator: " ").last else { return nil }
        return String(result)
    }
}
