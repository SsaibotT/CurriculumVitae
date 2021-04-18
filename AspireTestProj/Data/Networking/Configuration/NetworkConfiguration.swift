//
//  NetworkConfiguration.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 16.04.2021.
//

import Foundation

enum NetworkBases {
    case gistsBase
    case gistsRaw
}

class NetworkConfiguration {
    
    private static let base = NetworkBases.gistsRaw

    // MARK: - Computed properties
    static public var baseURL: String {
        switch base {
        case .gistsBase: return "https://api.github.com"
        case .gistsRaw: return "https://gist.githubusercontent.com"
        }
    }
}
