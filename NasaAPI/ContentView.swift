//
//  ContentView.swift
//  NasaAPI
//
//  Created by Mark Vadimov on 22.05.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var animLogoView = true
    var body: some View {
        ZStack {
            if viewModel.showDetails {
                DetailsView(dataOfImage: Binding($viewModel.selectedData)!)
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .offset(x: -15, y: 21)
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
                .onTapGesture
                {
                    self.viewModel.showDetails = false
                }
                
            } else {
                ZStack {
                    MainView()
                }
            }
            if viewModel.fly {
                LoadingView()
            }
        }
        .background(Image("moon"))
    }
}

#Preview {
    ContentView().environmentObject(ViewModel())
}
