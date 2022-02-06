//
//  ContributorDetailVC.swift
//  vlcContributors
//
//  Created by andrey rulev on 06.02.2022.
//

import UIKit

class ContributorDetailVC: UIViewController {
    
    // MARK: - Private properties
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var avatarImage: UIImageView!
    
    private let viewModel: ContributorDetailViewModel!
    
    // MARK: - Lifecycle
    
    init(viewModel: ContributorDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: - Configure

private extension ContributorDetailVC {
    func configure() {
        nameLabel.text = viewModel.name
        
        if let avatarLink = viewModel.avatarLink,
           let avatarUrl = URL(string: avatarLink) {
            avatarImage.sd_setImage(with: avatarUrl)
        }
    }
}
