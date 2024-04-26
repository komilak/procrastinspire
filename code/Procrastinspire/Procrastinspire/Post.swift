//
//  Post.swift
//  ios101-project5-tumbler
//

import Foundation
import SwiftSoup


// response [tagged] / post > body
//blog/response / posts/  pohotos/ original size/ url


struct Tagged: Decodable {
    let response: Response
}

struct Response: Decodable {
    let posts: [Post]
}
// Define the Post model
struct Post: Decodable {
    let summary: String
    var body: String
//    var trail: [Trail]
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        trail = []
//        if let singleTrail = try? values.decode(Trail.self, forKey: CodingKeys.trail) {
//            //if a single venue decoded append it to array
//            trail.append(singleTrail)
//        } else if let multiTrail = try? values.decode([Trail].self, forKey: CodingKeys.trail) {
//            //if a multi venue decoded, set it as venue
//            trail = multiTrail
//        }
//        enum CodingKeys: String, CodingKey { case trail }
//    }
    
    // Define the Trail model
//    struct Trail: Decodable {
//        
//        
//        // Custom decoding logic to map "content" to "postContent"
//        private enum CodingKeys: String, CodingKey {
//            case postContent = "content"
//        }
//        let postContent: String
        
    //    // Access image links directly through the trail
    //    var images: [String] {
    //        return postContent.getImagesFromPost()
    //    }
        
        //var imageLinks: PostInfo
//    }
    
}

struct myPost {
    var images: [PhotoLink]?
    init(images: [PhotoLink]? = nil) {
        self.images = images
    }
    
}

struct PhotoLink {
    var url: URL
    init(url: URL) {
        self.url = url
    }
    
    
    
}


extension URL {
    init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }

        self = url
    }
}





// Define the Content model
//struct Content: Decodable {
//    let htmlString: String
//    
//    
//    // Custom decoding logic to map "content" to "postContent"
//    private enum CodingKeys: String, CodingKey {
//        case postContent = "content"
//    }
//    
////    // Function to extract image links from the HTML content
////        func getImagesFromPost() -> [String] {
////            var images = [String]()
////            do {
////                let doc: Document = try SwiftSoup.parse(postContent)
////                let srcs: Elements = try doc.select("img[src]")
////                let srcsStringArray: [String?] = srcs.array().map { try? $0.attr("src").description }
////                // Filter out nil values and add non-nil image links to the result
////                images = srcsStringArray.compactMap { $0 }
////            } catch let error as Exception {
////                print("SwiftSoup Error: \(error)")
////            } catch {
////                print("Error parsing HTML")
////            }
////            
////            return images
////        }
//    
//
//}
//
//// Define the Image model
//struct Image: Decodable {
//    let url: String
//}





//
//struct Blog: Decodable {
//    let response: Response
//}
//
//struct Response: Decodable {
//    let posts: [Post]
//}
//
//struct Post: Decodable {
//    
//    /// A brief truncated version of the post caption
//    //let summary: String
//    
//    /// The full blog post caption
//    //let caption: String
//    
//    
//    let trail: [Trail]
//    
//    
//}


//struct Photo: Decodable {
//    let originalSize: PhotoInfo
//
//    enum CodingKeys: String, CodingKey {
//
//        // Maps API key name to a more "swifty" version (i.e. lowerCamelCasing and no _)
//        //posts >  trail > content > get first img src
//        case originalSize = "original_size"
//    }
//}
//posts/  pohotos/ original size/ url
//posts >  trail > content > img
//struct Trail: Decodable {
//    
//    
//    enum CodingKeys: String, CodingKey {
//    
//            // Maps API key name to a more "swifty" version (i.e. lowerCamelCasing and no _)
//            //posts >  trail > content > get first img src
//            case originalSize = "original_size"
//        }
//    
//    
//    
//}
//
//struct PostInfo: Decodable {
//    let url: String
//    
//    
//}

//struct PhotoInfo: Decodable {
//    
//    // The url for the location of the photo image
//    let url: URL
//    
//}


// post.photo.originalzise.url
// post.trail.content.htmll
// photo
//// Unwrap the optional poster path
//if let photo = post.photos.first {
//    let url = photo.originalSize.url
////let html = "<a href = \"https://mitsui-shopping-park.com/lalaport/koshien/\" target=\"_blank\"> https://mitsui-shopping-park.com/lalaport / koshien / </a>"

//getImagesFromPost()  {
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


