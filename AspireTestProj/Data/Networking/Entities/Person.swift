//
//  Person.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 18.04.2021.
//

import Foundation

struct Person: Codable {
    var name, secondName, city, sumarry: String?
    var workExperience: [WorkExperience]?
    var education: [Education]?
    var skills: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case secondName = "second_name"
        case city, sumarry
        case workExperience = "work_experience"
        case education, skills
    }
}

extension Person {
    
    static var emptyModel: Self {
        return Person(name: nil,
                      secondName: nil,
                      city: nil,
                      sumarry: nil,
                      workExperience: nil,
                      education: nil,
                      skills: nil)
    }
}
