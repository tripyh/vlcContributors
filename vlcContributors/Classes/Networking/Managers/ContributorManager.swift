//
//  ContributorManager.swift
//  vlcContributors
//
//  Created by andrey rulev on 30.01.2022.
//

import Foundation
import Moya

class ContributorManager {
    private static let provider = MoyaProvider<ContributorService>()
    
    class func contributors(_ completionHendler: @escaping([Contributor]?, String?) -> Void?) {
        provider.request(.contributors) { result in
            switch result {
            case .success(let success):
                do {
                    let contributors = try JSONDecoder().decode([Contributor].self, from: success.data)
                    completionHendler(contributors, nil)
                } catch let error {
                    completionHendler(nil, error.localizedDescription)
                }
            case .failure(let error):
                completionHendler(nil, error.localizedDescription)
            }
        }
    }
}
