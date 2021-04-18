//
//  Requester.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 17.04.2021.
//

import Foundation
import Combine

class RequestBuilder {
    
    static func getRequest<ItemModel: Decodable>(request: URLRequest) -> AnyPublisher<ItemModel, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: ItemModel.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
