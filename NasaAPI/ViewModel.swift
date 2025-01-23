//
//  ViewModel.swift
//  NasaAPI
//
//  Created by Mark Vadimov on 22.05.24.
//

import Foundation
import Alamofire
import Combine

class ViewModel: ObservableObject {
    @Published var datas: [DataOfPhoto] = []
    var cancellation: AnyCancellable?
    let service =  ApiService()
    @Published var showDetails = false
    var selectedData: DataOfPhoto? = nil
    @Published var fly = true
    
    init(){
        getDataImage()
    }
    
    func getDataImage(){
        cancellation = service.getDataImage()
            .mapError({(error) -> Error in
                print("!!! Download error \(error)")
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { data in
                self.datas.removeAll()
                self.datas.insert(contentsOf: data,at: 0)
                print("!!! comments list \(self.datas)")
             })
    }
}
