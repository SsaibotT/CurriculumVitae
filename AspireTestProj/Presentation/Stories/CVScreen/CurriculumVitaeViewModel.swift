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
    
    // MARK: - Input
    var loadPerson = PassthroughSubject<Void, Never>()
    
    // MARK: - Output
    @Published var person = Person.emptyModel
    
    // MARK: - Lifecycle
    init() {
        configureCombine()
        getPerson()
    }
    
    // MARK: - Configure Combine
    private func configureCombine() {
        loadPerson
            .sink { [weak self] _ in self?.getPerson() }
            .store(in: &cancelation)
    }
    
    // MARK: - Functions
    private func getPerson() {
        PersonAPIManager.shared.getPerson()
            .assign(to: \.person, on: self)
            .store(in: &cancelation)
    }
}
