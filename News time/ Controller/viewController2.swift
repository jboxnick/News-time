//
//  viewController2.swift
//  News time
//
//  Created by Macbook on 13.09.2022.
//

import UIKit

class viewController2: UIViewController, NewAPIDelegate {
    func didRetrieveCountryInfo(orbitNew: OrbitNew) {
        print("ok")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//      NewAPI().fetchNews()
        newsTableview.dataSource = self
        newAPI.delegate = self
        newAPI.getData()

        
    }
       var newAPI = NewAPI()
    var astronomyNew = [AstronomyNew].self
       @IBOutlet weak var newsTableview: UITableView!
}


extension viewController2: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 99996
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "سلام عليكم"
        return cell
    }
    
}


extension viewController2: NewAPIDelegate2 {
    func fetchAstronomyPost(spaceDataFardaLawla: [SpaceData]) {
        print("OK")
    }
    
    func fetchAstronomyPost(spaceDataFardaLawla: SpaceDataFardaLawla) {
        print("ok")
    }
    
    func didFailError(error: Error) {
        print("ok")

    }
    

    
    func fetchAstronomyPost(astronomyNew: AstronomyNew) {
        print(astronomyNew)
    }
    
    func errorr(error: Error) {
        print(error)
    }
    
    
    
}
