//
//  Giphy.swift
//  HotdropDemo
//
//  Created by Kushboo Patel on 6/21/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let giphyData = try? newJSONDecoder().decode(GiphyData.self, from: jsonData)

import Foundation

// MARK: - GiphyData
struct GiphyData: Decodable {
    
    let data: [Datum]
    
}

// MARK: - Datum
struct Datum: Decodable {
    let id, url, title: String
    let user : User?
    let images : Images?
  

    enum CodingKeys: String, CodingKey {
        case id
        case title = "title"
        case url = "url"
        case user
        case images

    }
}


//MARK: -IMAGE

struct Images : Codable
{
    let original : Original
    enum CodingKeys: String, CodingKey {
    
        case original
       }
    
}
struct Original : Codable
{
    let url : String
    
    enum CodingKeys: String, CodingKey {
    
        case url = "url"
       }
    
}




// MARK: - User
struct User: Codable {
    let avatarURL: String
    let bannerImage, bannerURL: String
    let profileURL: String
    let username, displayName, userDescription: String
    let instagramURL: String
    let websiteURL: String
    let isVerified: Bool

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case bannerImage = "banner_image"
        case bannerURL = "banner_url"
        case profileURL = "profile_url"
        case username
        case displayName = "display_name"
        case userDescription = "description"
        case instagramURL = "instagram_url"
        case websiteURL = "website_url"
        case isVerified = "is_verified"
    }
}


