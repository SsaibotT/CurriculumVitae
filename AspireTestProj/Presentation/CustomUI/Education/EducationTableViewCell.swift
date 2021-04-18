//
//  EducationTableViewCell.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 18.04.2021.
//

import UIKit

class EducationTableViewCell: UITableViewCell, NibLoadable {

    // MARK: - Static constants
    static let reuseIdentifier = "education"
    
    // MARK: - IBOutlets
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var yearsOfStudyingLabel: UILabel!
    
    // MARK: - Lifecycle
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Data configuration
    func dataConfiguration(schoolName: String, yearsOfStudying: String) {
        schoolNameLabel.text = schoolName
        yearsOfStudyingLabel.text = yearsOfStudying
    }
}
