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
        tableView.register(SummaryTableViewCell.nib, forCellReuseIdentifier: SummaryTableViewCell.reuseIdentifier)
        tableView.register(WorkExperienceTableViewCell.nib, forCellReuseIdentifier: WorkExperienceTableViewCell.reuseIdentifier)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Personal Info"
        case 1: return "Work Experience"
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return viewModel.person.workExperience?.count ?? 0
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath {
        case IndexPath(item: 0, section: 0):
            return personalInfo(for: tableView, at: indexPath)
        case IndexPath(item: 1, section: 0):
            return summaryCell(for: tableView, at: indexPath)
        case IndexPath(item: indexPath.row, section: 1): return workExperienceCell(for: tableView, at: indexPath)
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case IndexPath(item: 0, section: 0): return 80
        case IndexPath(item: 1, section: 0): return 120
        case IndexPath(item: indexPath.row, section: 1): return 181
        default: return 40
        }
    }
    
    // MARK: - Creating cells
    func personalInfo(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInfoTableViewCell.reuseIdentifier, for: indexPath) as? PersonalInfoTableViewCell else { return UITableViewCell() }
        
        let fullName = "\(viewModel.person.name ?? "") \(viewModel.person.secondName ?? "")"
        cell.dataConfiguration(fullName: fullName, city: viewModel.person.city ?? "")
        
        return cell
    }
    
    func summaryCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.reuseIdentifier, for: indexPath) as? SummaryTableViewCell else { return UITableViewCell() }
        
        cell.dataConfiguration(summaryText: viewModel.person.sumarry ?? "")
        return cell
    }
    
    func workExperienceCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkExperienceTableViewCell.reuseIdentifier, for: indexPath) as? WorkExperienceTableViewCell else { return UITableViewCell() }
        
        guard let workExperience = viewModel.person.workExperience?[indexPath.row] else { return UITableViewCell() }
        cell.dataConfiguration(companyName: workExperience.name,
                               workExperience: workExperience.workExperience,
                               position: workExperience.position)
        
        return cell
    }
}
