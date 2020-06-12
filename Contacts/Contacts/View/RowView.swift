//
//  RowView.swift
//  Contacts
//
//  Created by Nicolas Lucchetta on 19/11/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var name: String
    var value: String
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(value)
        }
    }
}
//
//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView()
//    }
//}
