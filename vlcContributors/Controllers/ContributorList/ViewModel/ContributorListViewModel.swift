//
//  ContributorListViewModel.swift
//  vlcContributors
//
//  Created by andrey rulev on 30.01.2022.
//

import Foundation

class ContributorListViewModel {
    
    // MARK: - Private properties
    
    var contributors = [Contributor]()
}


// MARK: - DataSource

extension ContributorListViewModel {
    var numberOfRows: Int {
        return contributors.count
    }
    
    func contributor(at index: Int) -> Contributor? {
        guard 0..<contributors.count ~= index else {
            return nil
        }
        
        return contributors[index]
    }
}
