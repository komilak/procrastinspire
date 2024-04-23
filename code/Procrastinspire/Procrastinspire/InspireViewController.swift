//
//  InspireViewController.swift
//  Procrastinspire
//
//  Created by Komila Khamidova on 4/23/24.
//
import UIKit
import NukeExtensions



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
            let post = posts[indexPath.row]
            
            // Configure the cell (i.e., update UI elements like labels, image views, etc.)
            
            // Unwrap the optional poster path
            if let photo = post.photos.first {
                let url = photo.originalSize.url
               
                // Create a url by appending the poster path to the base url. https://developers.themoviedb.org/3/getting-started/images
    //           let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) {
                
                // Use the Nuke library's load image function to (async) fetch and load the image from the image URL.
                NukeExtensions.loadImage(with: url,  into: cell.postImageView)
            }
            
            // Set the text on the labels
//            cell.summaryLabel.text = post.summary
            
            // Return the cell for use in the respective table view row
            return cell
        }
    
    // A property to store the movies we fetch.
    // Providing a default value of an empty array (i.e., `[]`) avoids having to deal with optionals.
    private var posts: [Post] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self

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
                    let blog = try JSONDecoder().decode(Blog.self, from: data)

                    DispatchQueue.main.async { [weak self] in
                        
                        
                        let posts = blog.response.posts
                        // Update the posts property so we can access post data anywhere in the view controller.

                        self?.posts = posts
                        
                        

                        print("✅ We got \(posts.count) posts!")
                        for post in posts {
                            print("🍏 Summary: \(post.summary)")
                        }
                        self?.tableView.reloadData()
                    }

                } catch {
                    print("❌ Error decoding JSON: \(error.localizedDescription)")
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

}
