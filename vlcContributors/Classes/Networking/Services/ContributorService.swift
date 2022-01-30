//
//  ContributorService.swift
//  vlcContributors
//
//  Created by andrey rulev on 30.01.2022.
//

import Moya

enum ContributorService: NetworkTarget {
    case contributors
    
    var path: String {
        return "repos/videolan/vlc/contributors"
    }
    
    var method: Method {
        return .get
    }
}
