import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var explanationTextView: UITextView!
    
    //MARK: - Properties
    
    private var dataTask: URLSessionDataTask?
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupAPI()
        
        getData()
    }
    
    //MARK: - Setup Functions
    
    private func setupViews() {
        
        imageView.layer.cornerRadius = 30
        titleLabel.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        explanationTextView.isEditable = false
    }
    
    private func setupAPI() {
        
        NewsAPI.shared.orbitNewsDelegate = self
    }
    
    //MARK: - Helper Functions
    
    func getData() {
        
        NewsAPI.shared.fetchOrbitNew()
    }
}

// MARK: - NewAPIDelegate

extension ViewController: OrbitNewsDelegate {
    
    func didRetrieveCountryInfo(orbitNew: OrbitNew) {
        print(orbitNew)
        
        DispatchQueue.main.async {
            self.titleLabel.text  = orbitNew.title
            self.explanationTextView.text   = orbitNew.explanation
            self.imageView.downloaded(from: orbitNew.url)
        }
    }
}
