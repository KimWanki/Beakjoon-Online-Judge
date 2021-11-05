//
//  GetImgurResponse.swift
//  Imgur2
//
//  Created by WANKI KIM on 2021/08/17.
//

import Foundation

struct GetImgurResponse {
    
    let imgurs: [Imgur]
    
    init(json: JSON) throws {
        guard let data = json["data"] as? [JSON] else { throw MyError.someError }
        let imgurs = data.map{ Imgur(json: $0) }.compactMap { $0 }
        self.imgurs = imgurs
    }
}
