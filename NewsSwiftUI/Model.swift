//
//  Model.swift
//  NewsSwiftUI
//
//  Created by Solayman Rana on 10/3/20.
//  Copyright © 2020 Solayman Rana. All rights reserved.
//

import Foundation
import SwiftUI

struct Model: Codable,Hashable,Identifiable{
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}
