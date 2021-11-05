//
//  NetworkingService.swift
//  Imgur2
//
//  Created by WANKI KIM on 2021/08/17.
//

import UIKit

typealias JSON = [String: Any]

class NetworkingService {
    
    static let shared = NetworkingService()
    private init() {}
    
    let session = URLSession.shared
    
    func getImgurs(success successBlock: @escaping (GetImgurResponse) -> Void) {
        guard let url = URL(string: "https://api.imgur.com/3/gallery/r/cats") else { return }
        
        var request = URLRequest(url: url)
        request.addValue("Client-ID 69d95bde8ff1448", forHTTPHeaderField: "Authorization")
        session.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else { return }
                let getImgurResponse = try GetImgurResponse(json: json)
                DispatchQueue.main.async {
                    successBlock(getImgurResponse)
                }
            } catch {}
        }.resume()
    }
    
    func downloadImage(from link: String, success successBlock: @escaping (UIImage) -> Void) {
        guard let url = URL(string: link) else { return }
        session.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let image = UIImage(data: data)
                  else { return }
            DispatchQueue.main.async {
                successBlock(image)
            }
        }.resume()
    }
}
