//
//  Old Data.swift
//  News time
//
//  Created by Julian Boxnick on 21.09.22.
//

import Foundation




//    func getData() {
//        print("here")
//
//        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles?_limit=10") else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else {
//                let tempError = error!.localizedDescription
//                DispatchQueue.main.async {
//                    self.news = [SpaceDataFardaLawla(id: 0, publishedAt: tempError, summary: "Error", newsSite: "Error", title: "Error",            url: "Try swiping down to refresh as soon as you have internet again.", imageUrl: "Error")]
//                }
//                return }
//            let SpaceDataFardaTania = try! JSONDecoder().decode([SpaceDataFardaLawla].self, from: data)
//                            DispatchQueue.main.async {
//                            print(SpaceDataFardaTania)
//                            print("Loaded new data successfully! Articles: \(SpaceDataFardaTania.count)")
//                           self.news = SpaceDataFardaTania
//                            }
//            delegate2.fetchAstronomyPost(spaceDataFardaLawla: SpaceDataFardaTania)
//
//    }.resume()
//}


//func fetchData() {
//    
//    let urlString = "https://api.nasa.gov/planetary/apod?api_key=Ecj7Q7fjoHqXViZQuBEvO7oKPwXGDfYJ16btBUgy"
//    if let url = URL(string: urlString) {
//    let session = URLSession(configuration: .default)
//    let task=session.dataTask(with: url, completionHandler: taskHandler(data:urlResponse:error:))
//    
//    task.resume()
//        
//    } else {
//        print ("error fetching data")
//    }
//}
