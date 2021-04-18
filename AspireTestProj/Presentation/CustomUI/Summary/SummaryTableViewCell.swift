//
//  SummaryTableViewCell.swift
//  AspireTestProj
//
//  Created by Serhii Semenov on 18.04.2021.
//

import UIKit

class SummaryTableViewCell: UITableViewCell, NibLoadable {

    // MARK: - Static constants
    static let reuseIdentifier = "summary_info"
    
    // MARK: - IBOutlets
    @IBOutlet weak var summaryTextLabel: UILabel!
    
    // MARK: - Lifecycle
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Data configuration
    func dataConfiguration(summaryText: String) {
        summaryTextLabel.text = summaryText
    }
}
