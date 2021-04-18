//
//  RequestPath.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 17.04.2021.
//

import Foundation

enum RequestPath {
    // MARK: - Cases
    case rawPath
    
    // MARK: - String representation
    private var pathValue: String {
        switch self {
        case .rawPath: return "/SsaibotT/7aaf7ce50fdd9194e3023aa190238eb1/raw/ed8ce20562c0b5424a91ce7619312e7b42032d3d/gistfile1.json"
        }
    }
    
    var value: String {
        return "\(NetworkConfiguration.baseURL)\(pathValue)"
    }
    
    func formatted(args: [CVarArg]?) -> String {
        guard let arguments = args, !arguments.isEmpty else { return self.value }
        return String(format: self.value, arguments: arguments)
    }
}
