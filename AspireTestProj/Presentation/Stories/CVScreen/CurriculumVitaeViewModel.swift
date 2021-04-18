//
//  CurriculumVitaeViewModel.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 18.04.2021.
//

import Foundation
import Combine

class CurriculumVitaeViewModel: ObservableObject {
    
    // MARK: - Properties
    private var cancelation: Set<AnyCancellable> = []
    
    // MARK: - Output
    @Published var person = Person.emptyModel
    
    // MARK: - Lifecycle
    init() {
        getPerson()
    }
    
    // MARK: - Functions
    private func getPerson() {
        PersonAPIManager.shared.getPerson()
            .assign(to: \.person, on: self)
            .store(in: &cancelation)
    }
}
