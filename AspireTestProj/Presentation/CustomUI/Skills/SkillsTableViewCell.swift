//
//  SkillsTableViewCell.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 18.04.2021.
//

import UIKit

class SkillsTableViewCell: UITableViewCell, NibLoadable {

    // MARK: - Static constants
    static let reuseIdentifier = "skills"
    
    // MARK: - IBOutlets
    @IBOutlet weak var skillsLabel: UILabel!
    
    // MARK: - Lifecycle
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Data configuration
    func dataConfiguration(skills: [String]) {
        skillsLabel.text = skills.joined(separator: ", ")
    }
}
