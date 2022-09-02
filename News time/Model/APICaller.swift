import Foundation

protocol NewAPIDelegate {
    func didRetrieveCountryInfo(orbitNew: OrbitNew)
}

class NewAPI {
    
    var delegate: NewAPIDelegate?
    
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
    
    func taskHandler(data: Data?, urlResponse: URLResponse?, error: Error?)->Void{
        
        do {
            let orbitNews = try JSONDecoder().decode(OrbitNew.self, from: data!)
            let firstNew = orbitNews
            delegate?.didRetrieveCountryInfo(orbitNew: firstNew)
                        
        } catch {
            
            print (error)
             
        }

    }
    
}
