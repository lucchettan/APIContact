//
//  DetailController.swift
//  Contacts
//
//  Created by Nicolas Lucchetta on 19/11/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct DetailController: View {
    var user: User
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack {
            ZStack {
                if imageLoader.img != nil {
                    Image(uiImage: imageLoader.img!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
//                        .overlay(Rectangle().stroke(Color.gray, lineWidth: 2))
                        .blur(radius: 10, opaque: true)
                }
                if imageLoader.img != nil {
                    HStack {
                        Image(uiImage: imageLoader.img!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            .offset(y: 100)
                        Spacer()
                    }.padding()
                }
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
            
            Text(user.login.username)
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text(user.name.first + " " + user.name.last)
            
            Divider().offset(y: 7)
            
            Form {
                Section(header: Text("Contact")) {
                    RowView(name: "Téléphone: ", value: user.cell)
                    RowView(name: "Mail: ", value: user.email)
                }
                Section {
                    RowView(name: "Age: ", value: String(user.dob.age))
                    RowView(name: "Date de Naissance: ", value: user.dob.date)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            self.imageLoader.loadFrom(urlString: self.user.picture.large)
        }
    }
}

//struct DetailController_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailController()
//    }
//}
