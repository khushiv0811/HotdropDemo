//
//  APIService.swift
//  HotdropDemo
//
//  Created by Kushboo Patel on 6/21/22.
//

import Foundation
class APIService :  NSObject {

    func apiToGetGiphyData(limit : String, type : String, completion : @escaping (GiphyData) -> ()){
        var source = ""
        if type == "gif"{
            source = baseUrlGifs
        }else{
            source = baseUrlStickers
        }
        source = source + Urlendpoint + Giphyapikey + "&limit=" + limit + "&rating=g"
        let sourcesURL = URL(string: source)!
        URLSession.shared.dataTask(with: sourcesURL) { (jsondata, urlResponse, error) in
            if let jsondata = jsondata {
                
                let jsonDecoder = JSONDecoder()
                
                let giphy = try? jsonDecoder.decode(GiphyData.self, from: jsondata)
            
                completion(giphy!)
            }
            
        }.resume()
    }
    
}
