//
//  Config+server.swift
//  vlcContributors
//
//  Created by andrey rulev on 30.01.2022.
//

import Foundation

struct Config {
    static let serverBaseURL: URL = {
        return URL(string: "https://api.github.com/")!
    }()
}
