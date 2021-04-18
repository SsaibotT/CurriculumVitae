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
        configureImageView()
    }
    
    private func configureImageView() {
        avatarImageView.image = UIImage(named: "Avatar")
        avatarImageView.layer.cornerRadius = 10.0
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderColor = UIColor.lightGray.cgColor
        avatarImageView.layer.borderWidth = 3.0
    }
}
