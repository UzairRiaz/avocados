//
//  FactModel.swift
//  Avocados
//
//  Created by Umair Riaz on 08/08/2021.
//

import SwiftUI

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
