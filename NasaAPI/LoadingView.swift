//
//  LoadingView.swift
//  NasaAPI
//
//  Created by Mark Vadimov on 22.05.24.
//

import SwiftUI

struct LoadingView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var angle: Double = 0
    @State private var x: CGFloat = 0
    @State private var y: CGFloat = -2
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var count = 0.0
    @State private var goRocket = false
    
    var body: some View {
        VStack(spacing: -70){
            Image("rocket")
                .resizable()
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(angle))
                .offset(x: x, y: y)
                .onReceive(timer) { _ in
                    if (x < 1600) && (y > -550){
                        count += 0.3
                        x += CGFloat(count) * (goRocket ? 2.5 : 1.5)
                        y -= CGFloat(count) * (goRocket ? 0.5 : 2.5)
                    }
                    else {
                        viewModel.fly = false
                    }
                }
                .animation(Animation.easeIn(duration: goRocket ? 30 : 20).repeatForever(autoreverses: false))
                .onAppear {
                    if (x < 1400) && (y > -450){
                        self.angle = 360
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                            goRocket = true
                        }
                    }
                }
            
            Image("nasa")
                .resizable()
                .frame(width: 200, height: 200)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Image("moon"))
    }
}

#Preview {
    LoadingView().environmentObject(ViewModel())
}

