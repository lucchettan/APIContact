//
//  ImageLoader.swift
//  Contacts
//
//  Created by Nicolas Lucchetta on 19/11/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    var didchange = PassthroughSubject<UIImage?, Never>()
    
    @Published var img: UIImage? {
        didSet {
            didchange.send(img)
        }
    }
    
    func loadFrom (urlString: String){
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) {(d, _, _) in
            if let data = d {
                DispatchQueue.main.async {
                    self.img = UIImage(data: data)
                }
            }
        }.resume()
    }
}
