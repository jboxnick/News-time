import Foundation

protocol OrbitNewsDelegate {
    
    func didRetrieveCountryInfo(orbitNew: OrbitNew)
}

protocol SpaceDataDelegate {
    
    func fetchAstronomyPost(forSpaceData: [SpaceData])
    func didFailError(error: Error)
}

class NewsAPI {
    
    static let shared = NewsAPI()
    
    //MARK: - Delegates
    
    var orbitNewsDelegate: OrbitNewsDelegate?
    
    var spaceDataDelegate: SpaceDataDelegate?
        
    //MARK: - Properties
    
    var news : [SpaceData] = []
    
    //MARK: - Functions

    func getSpaceData() {

        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles?_limit=10") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [SpaceData(id: 0, publishedAt: tempError, summary: "Error", newsSite: "Error", title: "Error", url: "Try swiping down to refresh as soon as you have internet again.", imageUrl: "Error")]
                }
                return
            }
            
            let spaceDataArray = try! JSONDecoder().decode([SpaceData].self, from: data)
                            DispatchQueue.main.async {
                            print("Loaded new data successfully! Articles: \(spaceDataArray.count)")
                           self.news = spaceDataArray
                    }
                self.spaceDataDelegate?.fetchAstronomyPost(forSpaceData: spaceDataArray)
    }.resume()
}

    func fetchAstronomyNews() {
        
        let newsURL = "https://newsapi.org/v2/top-headlines?sources=google-news-sa&apiKey=2524838879e349c8a7683c7496112fda"
        guard let url = URL(string: newsURL) else { return }
        let urlSession = URLSession(configuration: .default)

        let task = urlSession.dataTask(with: url) { (data, respone, error) in
            
            if let error = error {
                
                //There must be an error
                
                print(error.localizedDescription)
                
            } else {
                
                //There is no error
            
                do {
                    
                    guard let data = data else { return }
                    
                let astronomyNew = try JSONDecoder().decode(AstronomyNew.self, from: data)
                
              //  self.astronomyNewsDelegate?.forExampleFunc(astronomyNew: astronomyNew)

                } catch {
                    print("We got some error in the \(#function)")
                }
            }
        }
        task.resume()
    }
    
    
    
    func fetchOrbitNew() {
        
        let urlNews = "https://api.nasa.gov/planetary/apod?api_key=Ecj7Q7fjoHqXViZQuBEvO7oKPwXGDfYJ16btBUgy"
        let url = URL(string: urlNews)
               let urlSession = URLSession(configuration: .default)

        let task = urlSession.dataTask(with: url!) { (data, respone, error) in
            
            if let error = error {
                
                //There must be an error
                
                print(error.localizedDescription)
                
            } else {
                
                //There is no error
            
                do {
                    
                    guard let data = data else { return }
                    
                let orbitNew = try JSONDecoder().decode(OrbitNew.self, from: data)
                
                    self.orbitNewsDelegate?.didRetrieveCountryInfo(orbitNew: orbitNew)

                } catch {
                    print("We got some error in the \(#function)")
                }
            }
        }
        task.resume()

    }
    
//    func taskHandler(data: Data?, urlResponse: URLResponse?, error: Error?) -> Void {
//        
//        guard let data = data else { return }
//        
//        do {
//            let orbitNews = try JSONDecoder().decode(OrbitNew.self, from: data)
//            let firstNew = orbitNews
//            orbitNewsDelegate?.didRetrieveCountryInfo(orbitNew: firstNew)
//                        
//        } catch {
//            print (error)
//        }
//    }
  }

