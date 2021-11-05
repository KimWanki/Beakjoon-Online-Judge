//
//  JokesAPI.swift
//  DI
//
//  Created by WANKI KIM on 2021/08/26.
//

import Foundation

struct JokesAPI {
    static var url = URL(string: "https://api.icndb.com/random")!
    
    var sampleData: Data {
        Data(
            """
            {
                "type": "success",
                "value": {
                    "id": 459,
                    "joke": "It is a test Joke",
                    "categories": []
                }
            }
            """.utf8
        )
    }
}

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }

struct JokeResponse: Decodable {
    let type: String
    let value: Joke
}

struct Joke: Decodable {
    let id: Int
    let joke: String
    let categories: [String]
}

class JokesAPIProvider {
    let session: URLSessionProtocol
    
    init(session: URLSessionProtocol){
        self.session = session
    }
    
    func fetchRandomJoke(completionHandler: @escaping (Result<JokeResponse, APIError>) -> Void) {
        let request = URLRequest(url: JokesAPI.url)
        let task: URLSessionDataTask = session.dataTask(with: request) {data, response, error in
            if let error = error {
                print("error")
                completionHandler(.failure(.serverError))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else { print("잘못된 response가 전달되었습니다.")
                completionHandler(.failure(.responseError))
                return
            }
            
            if let data = data,
               let jokeResponse = try? JSONDecoder().decode(JokeResponse.self, from: data) {
                print("서버로부터 받은 정보를 디코딩까지 완료했습니다.")
                completionHandler(.success(jokeResponse))
                return
            }
            
            completionHandler(.failure(.dataError))
        }
        
        
        task.resume()
    }
}


enum APIError: Error {
    case serverError
    case responseError
    case dataError
}

