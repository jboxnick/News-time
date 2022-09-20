import Foundation

protocol NewAPIDelegate {
    func didRetrieveCountryInfo(orbitNew: OrbitNew) //People

}

protocol NewAPIDelegate2 {
    func fetchAstronomyPost(spaceDataFardaLawla: [SpaceData])
    func didFailError(error: Error)
    
}

class NewAPI {
    var delegate: NewAPIDelegate?
    var delegate2: NewAPIDelegate2?
//    var news : [SpaceDataFardaLawla] = []
    var news : [SpaceData] = []

    
    
    func getData() {
        print("here")

        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles?_limit=10") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [SpaceData(id: 0, publishedAt: tempError, summary: "Error", newsSite: "Error", title: "Error",            url: "Try swiping down to refresh as soon as you have internet again.", imageUrl: "Error")]
                }
                return }
            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)
                            DispatchQueue.main.async {
                            print(spaceData)
                            print("Loaded new data successfully! Articles: \(spaceData.count)")
                           self.news = spaceData
                            }
            self.delegate2?.fetchAstronomyPost(spaceDataFardaLawla: spaceData)
            
            
            //Okay this seems like you get back an array of SpaceData, but you need an array of SpaceDataForDaLawda
        
    }.resume()
}

    
    
    
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
    
    func fetchNews() {
        let urlNews = "https://newsapi.org/v2/top-headlines?sources=google-news-sa&apiKey=2524838879e349c8a7683c7496112fda"
        let url = URL(string: urlNews)
       // var astronomyNew: [AstronomyNew]?
        //PLAY WITH CONFIGURATION PARAMETRES
        let urlSession = URLSession(configuration: .default)

        let task = urlSession.dataTask(with: url!) { (Data, URLResponse, Error) in
            if Error != nil {
                print(Error?.localizedDescription)

            } else {
                print("________")
                print(Data)
                print("AAAAAA")
                do {
                let posts2 = try JSONDecoder().decode(AstronomyNew.self, from: Data!)
                    print(posts2.summary)
                    let url = posts2.url
                    print("This ist the url: \(url)")
                    let imageURL = posts2.imageUrl
                    print("This ist the url: \(imageURL)")

//                    self.delegate2?.fetchAstronomyPost(astronomyNew: posts2)

                } catch {
print("WE ARE IN THE CATCH BLOCK")
                    print (error)

                }
            }
        }
        task.resume()

    }
    
    func fetchData() {
        
        let urlString = "https://api.nasa.gov/planetary/apod?api_key=Ecj7Q7fjoHqXViZQuBEvO7oKPwXGDfYJ16btBUgy"
        if let url = URL(string: urlString) {
        let session = URLSession(configuration: .default)
        let task=session.dataTask(with: url, completionHandler: taskHandler(data:urlResponse:error:))
        
        task.resume()
            
        } else {
            print ("error fetching data")
        }
        
    }
    
    func newFetchDataFunc() {
        let urlNews = "https://api.nasa.gov/planetary/apod?api_key=Ecj7Q7fjoHqXViZQuBEvO7oKPwXGDfYJ16btBUgy"
        let url = URL(string: urlNews)
               let urlSession = URLSession(configuration: .default)

        let task = urlSession.dataTask(with: url!) { (Data, URLResponse, Error) in
            if Error != nil {
                print(Error?.localizedDescription)

            } else {
                print("________")
                print(Data)
                print("AAAAAA")
                do {
                let posts2 = try JSONDecoder().decode(OrbitNew.self, from: Data!)
                    let url = posts2.url
                    print("This ist the url: \(url)")
                    
                    self.delegate?.didRetrieveCountryInfo(orbitNew: posts2)

//                    self.delegate2?.fetchAstronomyPost(astronomyNew: posts2)

                } catch {
print("WE ARE IN THE CATCH BLOCK")
                    print (error)

                }
            }
        }
        task.resume()

    }
    
    func taskHandler(data: Data?, urlResponse: URLResponse?, error: Error?) -> Void {
        
        do {
            let orbitNews = try JSONDecoder().decode(OrbitNew.self, from: data!)
            let firstNew = orbitNews
            delegate?.didRetrieveCountryInfo(orbitNew: firstNew)
                        
        } catch {
            
            print (error)
             
        }

    }
  }

