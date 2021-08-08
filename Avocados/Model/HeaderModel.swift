//
//  HeaderModel.swift
//  Avocados
//
//  Created by Umair Riaz on 06/08/2021.
//

import Foundation

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
