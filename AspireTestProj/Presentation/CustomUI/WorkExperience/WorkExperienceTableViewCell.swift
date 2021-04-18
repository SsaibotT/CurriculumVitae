//
//  WorkExperienceTableViewCell.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 18.04.2021.
//

import UIKit

class WorkExperienceTableViewCell: UITableViewCell, NibLoadable {

    // MARK: - Static constants
    static let reuseIdentifier = "work_experience"
    
    // MARK: - IBOutlets
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var workExperienceLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    // MARK: - Lifecycle
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Data configuration
    func dataConfiguration(companyName: String, workExperience: Int, position: String) {
        companyNameLabel.text = companyName
        workExperienceLabel.text = "\(workExperience) years"
        positionLabel.text = position
    }
}
