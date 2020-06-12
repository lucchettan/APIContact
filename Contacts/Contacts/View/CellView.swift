//
//  CellView.swift
//  Contacts
//
//  Created by Nicolas Lucchetta on 19/11/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct CellView: View {
    @ObservedObject var loader: ImageLoader
    
    var user: User
    
    var body: some View {
        NavigationLink(destination: DetailController(user: user)) {
            HStack{
                if loader.img != nil {
                    Image(uiImage: loader.img!)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                }
                VStack {
                    Text(user.login.username)
                        .font(.title)
                        .italic()
                    Text(user.name.first + " 2" + user.name.last)
                        .font(.headline)
                        .foregroundColor(Color.secondary)
                }.padding()
            }
            .onAppear() {
                self.loader.loadFrom(urlString: self.user.picture.thumbnail)
            }
        }
    }
}
