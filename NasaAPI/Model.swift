//
//  Model.swift
//  NasaAPI
//
//  Created by Mark Vadimov on 22.05.24.
//

import Foundation

struct DataOfPhoto: Codable {
    let copyright: String?
    let date: String
    let explanation: String?
    let hdurl: String?
    let media_type: String?
    let service_version: String?
    let title: String?
    let url: String?
    var id: String {date}
    
    private enum CodingKeys: String, CodingKey {
        case copyright
        case date
        case explanation
        case hdurl
        case media_type
        case service_version
        case title
        case url
    }
}
