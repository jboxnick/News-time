//
//  SpaceDataTableViewController.swift
//  News time
//
//  Created by Julian Boxnick on 21.09.22.
//

import UIKit

class SpaceDataTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var spaceData: [SpaceData] = []
    
    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
        NewsAPI.shared.getSpaceData()
        
    }
    
    //MARK: - Setup Functions
    
    private func setupViews() {
        
        NewsAPI.shared.spaceDataDelegate = self
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.spaceData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "spaceDataCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
                
        let spaceData = self.spaceData[indexPath.row]
        
        let title = spaceData.title
        let publishedDate = spaceData.publishedAt
        let imageURL = spaceData.imageUrl
        let url = spaceData.url
      
        
        content.text = title
        content.secondaryText = publishedDate
        
//        var imageView = UIImageView()
//        imageView.downloaded(from: imageURL)
//
//        let image = imageView.image
        
//        content.image = image
        
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.spaceData[indexPath.row]
        
        let destinationVC = WebViewViewController(url: data.url)
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - SpaceDataDelegate

extension SpaceDataTableViewController: SpaceDataDelegate {
    
    func fetchAstronomyPost(forSpaceData: [SpaceData]) {
        self.spaceData = forSpaceData
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailError(error: Error) {
        //
    }
}


import UIKit
import WebKit
class WebViewViewController: UIViewController, WKUIDelegate {
    
    let url: String!
    
    init(url: String!) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:self.url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }}
