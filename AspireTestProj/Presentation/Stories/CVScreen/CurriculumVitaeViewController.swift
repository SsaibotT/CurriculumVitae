//
//  CurriculumVitaeViewController.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 16.04.2021.
//

import Foundation
import UIKit
import Combine

class CurriculumVitaeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var cancelation: Set<AnyCancellable> = []
    let viewModel = CurriculumVitaeViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureVM()
    }
    
    // MARK: - Functions
    func configureUI() {
        
        tableView.register(PersonalInfoTableViewCell.nib, forCellReuseIdentifier: PersonalInfoTableViewCell.reuseIdentifier)
    }
    
    func configureVM() {
        
        viewModel.$person
            .dropFirst()
            .sink { [weak self] _ in self?.tableView.reloadData() }
            .store(in: &cancelation)
    }
}

// MARK: - Extensions
extension CurriculumVitaeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0: return personalInfo(for: tableView, at: indexPath)
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 80
        default: return 40
        }
    }
    
    func personalInfo(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInfoTableViewCell.reuseIdentifier, for: indexPath) as? PersonalInfoTableViewCell else { return UITableViewCell() }
        
        let fullName = "\(viewModel.person.name ?? "") \(viewModel.person.secondName ?? "")"
        cell.dataConfiguration(fullName: fullName, city: viewModel.person.city ?? "")
        
        return cell
    }
}
