//
//  PersonalInfoTableViewCell.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 18.04.2021.
//

import UIKit

class PersonalInfoTableViewCell: UITableViewCell, NibLoadable {

    // MARK: - Static constants
    static let reuseIdentifier = "personal_info"
    
    // MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    // MARK: - Lifecycle
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Data configuration
    func dataConfiguration(fullName: String, city: String) {
        fullNameLabel.text = fullName
        cityLabel.text = city
        avatarImageView.image = UIImage(named: "Avatar")
    }
}
