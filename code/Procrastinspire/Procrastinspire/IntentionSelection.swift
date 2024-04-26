//
//  IntentionSelection.swift
//  Procrastinspire
//
//  Created by Komila Khamidova on 4/26/24.
//

import Foundation

import Foundation

struct IntentionSelection: Codable, Equatable {
    enum Option: Int, Codable {
        case work = 0
        case relax = 1
        case learn = 2
        case cook = 3
        
        var defaultURL: String {
            switch self {
            case .work:
                return "https://example.com/option1"
            case .relax:
                return "https://example.com/option2"
            case .learn:
                return "https://example.com/option3"
            case .cook:
                return "https://example.com/option4"
            }
        }
    }
    
    let intention: Option
    let urlString: String
    
    init(intention: Option) {
        self.intention = intention
        self.urlString = intention.defaultURL
    }
    
    
    
}

extension IntentionSelection{
    // A method to retrieve the intention selection from UserDefaults
    static func load(forKey key: String) -> IntentionSelection? {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: key),
           let loadedIntention = try? JSONDecoder().decode(IntentionSelection.self, from: data) {
            return loadedIntention
        }
        return nil
    }
    
    
    // A method to save the intention selection to UserDefaults
    static func save(_ intention: [IntentionSelection], forKey key: String) {
        let defaults = UserDefaults.standard
        if let encodedIntention = try? JSONEncoder().encode(intention) {
            defaults.set(encodedIntention, forKey: key)
        }
    }
    
    // A method to remove the intention selection from UserDefaults
    static func clear(forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
    }
}


//struct Intention: Codable {
//    let intentionCode: IntentionCode
//    
//    init(intentionCode: IntentionCode) {
//        self.intentionCode = intentionCode
//    }
//    
//}
//
//enum IntentionCode: Codable {
//    case work
//    case relax
//    case learn
//    case cook
//
//    
//    var intentLink: String {
//        switch self {
//        case .work:
//            return "https://api.tumblr.com/v2/blog/thatcupidgirl/posts/photo?&api_key=1zT8CiXGXFcQDyMFG7RtcfGLwTdDjFUJnZzKJaWTmgyK4lKGYk"
//        case .relax:
//            return "https://api.tumblr.com/v2/blog/uroko/posts/photo?&api_key=1zT8CiXGXFcQDyMFG7RtcfGLwTdDjFUJnZzKJaWTmgyK4lKGYk"
//        case .learn:
//            return "https://api.tumblr.com/v2/blog/juliaxyn/posts/photo?&api_key=1zT8CiXGXFcQDyMFG7RtcfGLwTdDjFUJnZzKJaWTmgyK4lKGYk"
//        case .cook:
//            return "https://api.tumblr.com/v2/blog/daily-deliciousness/posts/photo?&api_key=1zT8CiXGXFcQDyMFG7RtcfGLwTdDjFUJnZzKJaWTmgyK4lKGYk"
//        }
//    }
//    
//    
//    
//
//}
