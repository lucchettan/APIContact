//
//  UserGetter.swift
//  Contacts
//
//  Created by Nicolas Lucchetta on 18/11/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//
import SwiftUI
import Combine

class UserGetter: ObservableObject {
    
    var didchange = PassthroughSubject<[User], Never>()

    @Published var users: [User] = [] {
        didSet {
            didchange.send(users)
        }
    }
    
    let getBase = "https://randomuser.me/api/?results=20"
    
    func getUsers() {
        guard let url = URL(string: getBase) else {return}
        URLSession.shared.dataTask(with: url) {(d, _, _) in
            if let data = d {
                do {
//                    ici on va decoder le JSON recupere sur l'url
                    let res = try JSONDecoder().decode(ResultJson.self , from: data)
                    DispatchQueue.main.async {
                        self.users = res.results
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
}




//class ImageLoader: ObservableObject {
//var didChange = PassthroughSubject<UIImage?, Never>()
//
//@Published var img: UIImage? {
//didSet {
//didChange.send(img)
//}
//}
//
//func loadFrom(urlString: String) {
//guard let url = URL(string: urlString) else { return }
//URLSession.shared.dataTask(with: url) { (d, _, _) in
//if let data = d {
//DispatchQueue.main.async {
//self.img = UIImage(data: data)
//}
//}
//}.resume()
//}
//}
