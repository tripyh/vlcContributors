//
//  ContributorListCell.swift
//  vlcContributors
//
//  Created by andrey rulev on 30.01.2022.
//

import UIKit
import SDWebImage

class ContributorListCell: BaseTableViewCell {
    
    // MARK: - Private properties
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var idLabel: UILabel!
    @IBOutlet private var avatarImage: UIImageView!
    
    // MARK: - PrepareForReuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        idLabel.text = nil
        avatarImage.sd_cancelCurrentImageLoad()
        avatarImage.layer.removeAllAnimations()
        avatarImage.image = nil
    }
    
    // MARK: - Configure
    
    func configure(_ contributor: Contributor?) {
        nameLabel.text = contributor?.login
        
        if let idActual = contributor?.id {
            idLabel.text = String(idActual)
        }
        
        if let avatarLink = contributor?.avatarUrl,
           let avatarUrl = URL(string: avatarLink) {
            avatarImage.sd_setImage(with: avatarUrl)
        }
    }
}
