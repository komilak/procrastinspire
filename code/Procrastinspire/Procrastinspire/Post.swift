//
//  Post.swift
//  ios101-project5-tumbler
//

import Foundation
import SwiftSoup

struct Blog: Decodable {
    let response: Response
}

struct Response: Decodable {
    let posts: [Post]
}

struct Post: Decodable {
    
    /// A brief truncated version of the post caption
    let summary: String
    
    /// The full blog post caption
    let caption: String
    let photos: [Photo]
}

struct Photo: Decodable {
    let originalSize: PhotoInfo
    
    enum CodingKeys: String, CodingKey {
        
        // Maps API key name to a more "swifty" version (i.e. lowerCamelCasing and no `_`)
        //posts >  trail > content > get first img src
        case originalSize = "original_size"
    }
}

struct PhotoInfo: Decodable {
    
    // The url for the location of the photo image
    let url: URL
}

//// Unwrap the optional poster path
//if let photo = post.photos.first {
//    let url = photo.originalSize.url
////let html = "<a href = \"https://mitsui-shopping-park.com/lalaport/koshien/\" target=\"_blank\"> https://mitsui-shopping-park.com/lalaport / koshien / </a>"


//func getImagesFromPost() {
//    do {
//        let doc: Document = try SwiftSoup.parse(html)
//        let srcs: Elements = try doc.select("img[src]")
//        let srcsStringArray: [String?] = srcs.array().map { try? $0.attr("src").description }
//        // do something with srcsStringArray
//        
//    } catch Exception.Error(_, let message) {
//        print(message)
//    } catch {
//        print("error")
//    }
//}
