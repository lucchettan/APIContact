//
//  ContentView.swift
//  Contacts
//
//  Created by Nicolas Lucchetta on 18/11/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userGetter = UserGetter()
    
    var body: some View {
        NavigationView {
            List(userGetter.users, id: \.name.first) { user in
                CellView(loader: ImageLoader(), user: user)
            }
            .navigationBarTitle("Utilisateurs")
        }.onAppear() {
            self.userGetter.getUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
