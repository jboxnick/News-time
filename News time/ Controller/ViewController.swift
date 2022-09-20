import UIKit

class ViewController: UIViewController {
    private var dataTask: URLSessionDataTask?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var TitleView: UILabel!
    @IBOutlet weak var textView: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        newAPI.delegate = self
        newAPI.fetchData()
        imageView.layer.cornerRadius = 30
        TitleView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        //imageView.downloaded(from: "https://apod.nasa.gov/apod/image/2209/m51_l2_1024.jpg")
        newAPI.getData()
        newAPI.fetchNews()
        newAPI.newFetchDataFunc()


    }
      var newAPI = NewAPI()
    
}

// MARK: - NewAPIDelegate

extension ViewController: NewAPIDelegate {
    
    func didRetrieveCountryInfo(orbitNew: OrbitNew) {
        print(orbitNew)
        
        DispatchQueue.main.async {
            self.TitleView.text  = orbitNew.title
            self.textView.text   = orbitNew.explanation
            self.imageView.downloaded(from: orbitNew.url)
    }
}

}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
