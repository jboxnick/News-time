//
//  tryCocoaPodsViewController.swift
//  News time
//
//  Created by Macbook on 04.09.2022.
//

import UIKit
//import Kingfisher


class tryCocoaPodsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! 
 
    var currentIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButton2(_ sender: Any) {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
//        imageView.k
    }
    
    @IBAction func perviousButton2(_ sender: Any) {
    }
}

let link = [ "https://unsplash.com/photos/vhSz50AaFAs", "https://unsplash.com/photos/N3BQHYOVq5E", "https://unsplash.com/photos/ScBkW9AKgcA"]


