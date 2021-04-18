//
//  WorkExperience.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 18.04.2021.
//

import Foundation

struct WorkExperience: Codable {
    let name: String
    let workExperience: Int
    let position: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case workExperience = "work_experience"
        case position
    }
}
