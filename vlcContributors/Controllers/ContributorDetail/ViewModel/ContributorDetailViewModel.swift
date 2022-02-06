//
//  ContributorDetailViewModel.swift
//  vlcContributors
//
//  Created by andrey rulev on 06.02.2022.
//

import Foundation

class ContributorDetailViewModel {
    
    // MARK: - Public properties
    
    var name: String? {
        return contributor.login
    }
    
    var avatarLink: String? {
        return contributor.avatarUrl
    }
    
    // MARK: - Private properties
    
    private let contributor: Contributor!
    
    // MARK: - Lifecycle
    
    init(contributor: Contributor) {
        self.contributor = contributor
    }
}
