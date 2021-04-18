//
//  PersonApiManager.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 18.04.2021.
//

import Foundation
import Combine

class PersonAPIManager {
    
    // MARK: - Properties
    static var shared = PersonAPIManager()
    
    init() {}
    
    // MARK: - Functions
    func getPerson() -> AnyPublisher<Person, Never> {
        
        if let url = URL(string: RequestPath.rawPath.formatted(args: nil)) {
            let request = URLRequest(url: url)
            
            return RequestBuilder.getRequest(request: request)
                .catch({ error -> Just<Person> in
                    print(error.localizedDescription)
                    return Just(Person.emptyModel)
                })
                .eraseToAnyPublisher()
        }
        
        return Just(Person.emptyModel)
            .eraseToAnyPublisher()
    }
}
