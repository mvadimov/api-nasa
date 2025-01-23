//
//  DetailsView.swift
//  NasaAPI
//
//  Created by Mark Vadimov on 22.05.24.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var dataOfImage: DataOfPhoto
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                Text(dataOfImage.title ?? "No title")
                    .font(.system(size: 30))
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                
                ImageView(url: dataOfImage.url ?? "No url")
                    .frame(maxWidth: 400, maxHeight: 400)
                    .foregroundStyle(Color.white)
                
                Text(dataOfImage.date ?? "No date")
                    .foregroundStyle(Color.white)
                
                Text(dataOfImage.explanation ?? "No explanation")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 15))
                    .fontWeight(.light)
                    .padding(.horizontal, 15)
                
                
                if let cop = dataOfImage.copyright {
                    let year = String(dataOfImage.date.prefix(4) ?? "")
                    
                    Text("Copyright © \(year) | \(cop ?? "No copyright")")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 15))
                        .foregroundStyle(Color.white)
                        .frame(width: 300, height: 40, alignment: .center)
                }

            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color(UIColor.grayItem))
    }
}


struct ImageView: View {
    var url = ""
    
    var body: some View {
        if let url = URL(string: url) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty: ProgressView()
                case .success(let image): image.resizable().aspectRatio(contentMode: .fit).cornerRadius(10)
                case .failure: Image(systemName: "photo").resizable().aspectRatio(contentMode: .fit)
                @unknown default: EmptyView()
                }
            }
        } else {
            Text("Invalid URL")
        }
    }
}


#Preview{
    DetailsView(dataOfImage: .constant(DataOfPhoto(copyright: "Wes Higgins", date: "2021-01-21", explanation: "Interstellar dust clouds and glowing nebulae abound in the fertile constellation of Orion. One of the brightest, M78, is centered in this colorful, wide field view, covering an area north of Orion's belt. At a distance of about 1,500 light-years, the bluish reflection nebula is around 5 light-years across. Its tint is due to dust preferentially reflecting the blue light of hot, young stars. Reflection nebula NGC 2071 is just to the left of M78. Flecks of emission from Herbig-Haro objects, energetic jets from stars in the process of formation, stand out against the dark dust lanes. The exposure also brings out the region's fainter, pervasive reddish glow of atomic hydrogen gas.", hdurl: "https://apod.nasa.gov/apod/image/2101/M78wideHiggins.jpg", media_type: "image", service_version: "v1", title: "M78 Wide Field", url: "https://apod.nasa.gov/apod/image/2101/M78wideHiggins1024.jpg")))
}
