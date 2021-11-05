import UIKit

var greeting = "Hello, playground"

enum HttpMethod {
    case get
    case post
}

protocol HttpBody {
    func makeBody() -> Data?
}

struct MultiPartFormData: HttpBody {
    func makeBody() -> Data?{
        print("멀티 파티 폼 데이터를 만들어 뜨릴게여")
        return Data()
    }
}

struct JsonObject: HttpBody {
    func makeBody() -> Data? {
        print("Json 폼 데이터를 만들어 드릴게여")
        return Data()
    }
}



enum HttpURL: CustomStringConvertible {
    case getItemCollection
    case getItem
    case deleteItem
    case patchItem
    case postItem

    enum HttpMethod: CustomStringConvertible {
        case get
        case post
        case patch
        case delete

        public var description: String {

        }
    }

    var description: String {

    }
}




struct NetworkHandler {
    private let session = URLSession.shared

    // get, post, delete, patch
    request(path: , type: .post: form: MultiPartForm, data: nil)
    request(path: , type: .get: form: nil, data: nil)
    request(path: , type: .delete: form: Json, data: nil)

    func request(path: String, type: HttpMethod, form: HttpBody?, data: [String: Any], media: [Media]) -> Data? {
        let url = URL(string: path)
        body = form?.makeBody()
        request.setValue(body)
        session.dataTask(with: url) { <#Data?#>, <#URLResponse?#>, <#Error?#> in
            <#code#>
        }

        return
    }

}

let multiPart = request(form: MultiPartFormData())
let get = request(form: nil)
let json = request(form: JsonObject())



//
//struct Media {
//    let key: String
//    let filename: String
//    let data: Data
//    let mimeType: String
//
//    init?(withImage image: UIImage, forKey key: String) {
//        self.key = key
//        self.mimeType = "image/jpeg"
//        self.filename = "photo\(arc4random()).jpeg"
//
//        guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
//        self.data = data
//    }
//}
//
//extension URLSession: SessionComponent { }
//
//protocol SessionComponent {
//    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
//}
//
//class NetworkHandler {
//
//    private let session: SessionComponent
//
//    init(session: SessionComponent) {
//        self.session = session
//    }
//
//    func request(_ requestType: HttpMethod, format: HttpBody? = nil, data: Any? = nil, completionHandler:() -> Void) {
//
//    }
//    func generateBoundary() -> String {
//        return "Boundary-\(NSUUID().uuidString)"
//    }
//}
//
//struct JSONObject: HttpBody {
//    private let params: [String: Any]
//
//    init(params: Parameters) {
//        self.params = params
//    }
//
//    func createBody() -> Data {
//
//        return Data()
//    }
//}
//
//
//protocol HttpBody {
//    func createBody() -> Data
//}
//
//typealias Parameters = [String: Any]
//
//struct MultiPartFormData: HttpBody {
//    private let params: [String: Any]?
//    private let media: [Media]?
//    private let boundary: String
//
//    init(params: [String: Any], media: [Media]? = nil, boundary: String) {
//        self.params = params
//        self.media = media
//        self.boundary = boundary
//    }
//
//    func createBody() -> Data {
//        let lineBreak = "\r\n"
//        var body = Data()
//
//        if let parameters = params {
//            for (key, value) in parameters {
//                body.append("--\(boundary + lineBreak)")
//                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
//                body.append("\(value)\(lineBreak)")
//            }
//        }
//
//        if let media = media {
//            for photo in media {
//                body.append("--\(boundary + lineBreak)")
//                body.append("Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.filename)\"\(lineBreak)")
//                body.append("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
//                body.append(photo.data)
//                body.append(lineBreak)
//            }
//        }
//        body.append("--\(boundary)--\(lineBreak)")
//
//        return body
//    }
//
//    func generateBoundary() -> String {
//        return "Boundary-\(NSUUID().uuidString)"
//    }
//}
//
//extension Data {
//    mutating func append(_ string: String) {
//        if let data = string.data(using: .utf8) {
//            self.append(data)
//        }
//    }
//}
