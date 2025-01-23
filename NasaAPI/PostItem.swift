//
//  NewItem.swift
//  NasaAPI
//
//  Created by Mark Vadimov on 22.05.24.
//

import SwiftUI

struct PostItem: View {
    let dataOfImage: DataOfPhoto
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            //
            HStack{
                Text( dataOfImage.title ?? "No title")
                    .font(.system(size: 26))
                    .frame(height: 30, alignment: .leading)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.bottom, 7)
            //
            Text(dataOfImage.date ?? "No date")
                .font(.system(size: 20))
                .frame(height: 20, alignment: .leading)
                .fontWeight(.light)
            
            Text(dataOfImage.copyright ?? "No copyright")
                .font(.system(size: 18))
                .frame(height: 18, alignment: .leading)
                .fontWeight(.light)
            
        }
        .foregroundStyle(Color(UIColor.lightGrayName))
        .fontWeight(.semibold)
        .padding()
        .background(Color.grayItem.opacity(0.8))
        .cornerRadius(15)
        .shadow(color: .black, radius: 10, x:5, y: 5)
        .padding(5)
    }
}


#Preview {
    PostItem(dataOfImage: DataOfPhoto(copyright: "Wes Higgins", date: "2021-01-21", explanation: "Interstellar dust clouds and glowing nebulae abound in the fertile constellation of Orion. One of the brightest, M78, is centered in this colorful, wide field view, covering an area north of Orion's belt. At a distance of about 1,500 light-years, the bluish reflection nebula is around 5 light-years across. Its tint is due to dust preferentially reflecting the blue light of hot, young stars. Reflection nebula NGC 2071 is just to the left of M78. Flecks of emission from Herbig-Haro objects, energetic jets from stars in the process of formation, stand out against the dark dust lanes. The exposure also brings out the region's fainter, pervasive reddish glow of atomic hydrogen gas.", hdurl: "https://apod.nasa.gov/apod/image/2101/M78wideHiggins.jpg", media_type: "image", service_version: "v1", title: "M78 Wide Field", url: "https://apod.nasa.gov/apod/image/2101/M78wideHiggins1024.jpg"))
}
