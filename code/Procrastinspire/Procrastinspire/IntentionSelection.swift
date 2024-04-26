//
//  IntentionSelection.swift
//  Procrastinspire
//
//  Created by Komila Khamidova on 4/26/24.
//

import Foundation

struct Intention {
  let intentionCode: IntentionCode
}

enum IntentionCode {
    case work
    case relax
    case learn
    case cook

    
    var intentLink: String {
        switch self {
        case .work:
            return "https://api.tumblr.com/v2/blog/thatcupidgirl/posts/photo?&api_key=1zT8CiXGXFcQDyMFG7RtcfGLwTdDjFUJnZzKJaWTmgyK4lKGYk"
        case .relax:
            return "https://api.tumblr.com/v2/blog/uroko/posts/photo?&api_key=1zT8CiXGXFcQDyMFG7RtcfGLwTdDjFUJnZzKJaWTmgyK4lKGYk"
        case .learn:
            return "https://api.tumblr.com/v2/blog/juliaxyn/posts/photo?&api_key=1zT8CiXGXFcQDyMFG7RtcfGLwTdDjFUJnZzKJaWTmgyK4lKGYk"
        case .cook:
            return "https://api.tumblr.com/v2/blog/daily-deliciousness/posts/photo?&api_key=1zT8CiXGXFcQDyMFG7RtcfGLwTdDjFUJnZzKJaWTmgyK4lKGYk"
        }
    }
    

}
