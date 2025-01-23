//
//  NewGroup.swift
//  NasaAPI
//
//  Created by Mark Vadimov on 22.05.24.
//

import Foundation
import Alamofire
import Combine

class ApiService {
    static let BASE_URL = "https://api.nasa.gov/planetary/apod?api_key="
    static let API_KEY = "10KxBi1E3ucE9xoDrq6bjrJ4wEoYgclEIEx7aSdX"
    
    func getDataImage() -> AnyPublisher<[DataOfPhoto], AFError> {
        
        let publisher = AF.request(ApiService.BASE_URL + ApiService.API_KEY + "&count=20", method: .get)
            .publishDecodable(type: [DataOfPhoto].self)
        
        return publisher.value()
    }
    
}
