import Foundation
struct OrbitNew: Codable {
    var url         : String
    var title       : String
    var explanation : String
    
}

struct AstronomyNew: Codable {
    var publishedAt         : String
    var summary             : String
    var newsSite            : String
    var title               : String
    var url                 : String
    var imageUrl            : String
    
}


struct SpaceDataFardaLawla: Codable, Identifiable {
    var id: Int
    var publishedAt         : String
    var summary             : String
    var newsSite            : String
    var title               : String
    var url                 : String
    var imageUrl            : String
}


struct SpaceData: Codable, Identifiable {
    var id: Int
    var publishedAt         : String
    var summary             : String
    var newsSite            : String
    var title               : String
    var url                 : String
    var imageUrl            : String
}
