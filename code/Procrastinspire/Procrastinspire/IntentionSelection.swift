//
//  IntentionSelection.swift
//  Procrastinspire
//
//  Created by Komila Khamidova on 4/26/24.
//

import Foundation


enum IntentionCode {
    case work
    case relax
    case learn
    case cook

    
    var intentLink: String {
        switch self {
        case .work:
            return "string link to work related posts"
        case .relax:
            return "string link to relaxing posts"
        case .learn:
            return "Pstring link to study related posts"
        case .cook:
            return "string link to cooking related posts"
        }
    }
    

}
