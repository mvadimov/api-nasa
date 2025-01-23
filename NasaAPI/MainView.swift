//
//  MainView.swift
//  NasaAPI
//
//  Created by Mark Vadimov on 22.05.24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View
    {
        ScrollView {
            VStack(spacing: 20){
                ForEach(viewModel.datas, id: \.id){info in
                    PostItem(dataOfImage: info)
                        .onTapGesture {
                            self.viewModel.selectedData = info
                            self.viewModel.showDetails = true
                        }
                }
            }
        }
    }
}

#Preview{
    MainView().environmentObject(ViewModel())
}
