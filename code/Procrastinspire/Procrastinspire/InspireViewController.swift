//
//  InspireViewController.swift
//  Procrastinspire
//
//  Created by Komila Khamidova on 4/23/24.
//
import UIKit
import NukeExtensions
import SwiftSoup



class InspireViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows for the table.
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create, configure, and return a table view cell for the given row (i.e., `indexPath.row`)
        
        print("🍏 cellForRowAt called for row: \(indexPath.row)")
        
        // Get a reusable cell
        // Returns a reusable table-view cell object for the specified reuse identifier and adds it to the table. This helps optimize table view performance as the app only needs to create enough cells to fill the screen and reuse cells that scroll off the screen instead of creating new ones.
        // The identifier references the identifier you set for the cell previously in the storyboard.
        // The `dequeueReusableCell` method returns a regular `UITableViewCell`, so we must cast it as our custom cell (i.e., `as! MovieCell`) to access the custom properties you added to the cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        // Get the movie associated table view row
        let post = myPosts[indexPath.row + 1]
//        let customPost = myPosts[indexPath.row]
        
        // Configure the cell (i.e., update UI elements like labels, image views, etc.)
        
        
        
        // Unwrap the optional poster path
        if let photo = post.images?.first {
            let url = photo.url
            print("🍏 passing nuke a link of type: \(type(of: url))")
            
            // Create a url by appending the poster path to the base url. https://developers.themoviedb.org/3/getting-started/images
            //           let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) {
            
            // Use the Nuke library's load image function to (async) fetch and load the image from the image URL.
            NukeExtensions.loadImage(with: url,  into: cell.postImageView)
//            NukeExtensions.loadImage(with: post.images?.first, into: cell.postImageView)
        } else {
            print("❌ Error unwrapping")
        }
        
        // Set the text on the labels
        //            cell.summaryLabel.text = post.summary
        
        // Return the cell for use in the respective table view row
        return cell
    }
    
    
    // A property to store the posts we fetch.
    // Providing a default value of an empty array (i.e., `[]`) avoids having to deal with optionals.
    private var posts: [Post] = []
    private var myPosts: [myPost] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    
    //    func setupMorningRoutineSelection() {
    //        let morningRoutineSelectionClosure = { (action: UIAction) in
    //            print("morningRoutineSelection action")
    //        }
    //
    //        morningRoutineSelection.menu = UIMenu(children: [
    //            UIAction(title: "Work", handler: morningRoutineSelectionClosure),
    //            UIAction(title: "Relax", handler: morningRoutineSelectionClosure),
    //            UIAction(title: "Learn", handler: morningRoutineSelectionClosure),
    //            UIAction(title: "Cook", handler: morningRoutineSelectionClosure)
    //        ])
    //        morningRoutineSelection.showsMenuAsPrimaryAction = true
    //
    //        print(morningRoutineSelection.menu?.selectedElements.first?.title)
    //    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        //        setupMorningRoutineSelection()
        // Do any additional setup after loading the view.
        
        fetchPosts()
    }
    
    
    func fetchPosts() {
        let url = URL(string: "https://api.tumblr.com/v2/blog/juliaxyn/posts/photo?&api_key=1zT8CiXGXFcQDyMFG7RtcfGLwTdDjFUJnZzKJaWTmgyK4lKGYk")!
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
                print("❌ Response error: \(String(describing: response))")
                return
            }
            
            guard let data = data else {
                print("❌ Data is NIL")
                return
            }
            
            do {
                let tagged = try JSONDecoder().decode(Tagged.self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    
                    
                    let posts = tagged.response.posts
//                    myPosts = [myPost](repeating: nil, count: posts.count)
                    // Update the posts property so we can access post data anywhere in the view controller.
                    
                    self?.posts = posts
//                    self?.myPosts
                    
//                    var numPosts: Int = posts.count
                    
                    
//                    var myPosts = [myPost](repeating: nil, count: posts.count)
                    
                    
                    
                    print("✅ We got \(posts.count) posts!")
                    var num: Int = 0
                    for post in posts {
                        
                        // parse html body of post for image links
                        print("🍏 Summary: \(post.summary)")
                        var postImages = [String]()
                        do {
                            let doc: Document = try SwiftSoup.parse(post.body)
                            let srcs: Elements = try doc.select("img[src]")
                            let srcsStringArray: [String?] = srcs.array().map { try? $0.attr("src").description }
                            // Filter out nil values and add non-nil image links to the result
                            postImages = srcsStringArray.compactMap { $0 }
                        } catch let error as Exception {
                            print("SwiftSoup Error: \(error)")
                        } catch {
                            print("Error parsing HTML")
                        }
                        
                        
                        // convert the url strings to URL format, add to myPost 
//                        var urlArray: [URL] = []
                        var ind: Int = 0
                        // TODO MAKE NEW POST INIT WITH SOEMTHNG THEN ADD CORRECT URLS
                        let defaultUrl = URL(staticString: "https://www.petmd.com/sites/default/files/petmd-cat-happy-13.jpg")
                        let defaultUrl2 = URL(staticString: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg")
                        
                        let testImage = PhotoLink.init(url: defaultUrl)
                        let testImage2 = PhotoLink.init(url: defaultUrl2)
                        let testLinks: [PhotoLink] = [testImage, testImage2]
                        var thisPost = myPost.init(images: testLinks)
                        
//                        var defaultUrls: [PhotoLink]? = 
                            
                        print("✅ We got \(postImages.count) links!")
                        for parsedString in postImages{
                            print("🍏 link: \(parsedString)")
                            print("🍏 type: \(type(of: parsedString))")
                            if let newURL = URL(string: parsedString) {
                                // Add URL to the array
//                                urlArray.append(newURL)
                                print("🍏 type: \(type(of: newURL))")
                                if thisPost.images != nil{
                                    thisPost.images?.remove(at: 0)
//                                    thisPost.images?.remove(at: 0)
                                    thisPost.images?.append(PhotoLink.init(url: newURL))
                                    
                                    print("🍏 appended link: \(thisPost)")
                                } else {
                                    print("❌ thisPost is nil somehow")
                                }
//                                self?.myPosts.append()
                            } else {
                                // Handle invalid URL strings
                                print("Invalid URL string: \(parsedString)")
                            }
                            ind += 1
                        }
                        
                        self?.myPosts.append(thisPost)
                        
                        num += 1
                    }
//                    print("✅ We got \(self?.myPosts.count) posts!")
                    
                    self?.tableView.reloadData()
                }
                
            } catch {
                print("❌ Error decoding JSON: \(error)")
            }
            
        }
        session.resume()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    // Function to extract image links from the HTML content
//    func getImagesFromPost(post: Decodable) -> [String] {
//        var postImages = [String]()
//        do {
//            let doc: Document = try SwiftSoup.parse(post.trail.postContent.postContent)
//            let srcs: Elements = try doc.select("img[src]")
//            let srcsStringArray: [String?] = srcs.array().map { try? $0.attr("src").description }
//            // Filter out nil values and add non-nil image links to the result
//            postImages = srcsStringArray.compactMap { $0 }
//        } catch let error as Exception {
//            print("SwiftSoup Error: \(error)")
//        } catch {
//            print("Error parsing HTML")
//        }
//        
//        return postImages
//    }
    
    
    
//    func imageStringToUrl(postImages: [String]) -> [URL] {
//        var urlArray: [URL] = []
//        for parsedString in postImages{
//            if let newURL = URL(string: parsedString) {
//                // Add URL to the array
//                urlArray.append(newURL)
//            } else {
//                // Handle invalid URL strings
//                print("Invalid URL string: \(parsedString)")
//            }
//            
//            return urlArray
//        }
//        
//        
//    }
}


