//
//  Api.swift
//  NewsSwiftUI
//
//  Created by Solayman Rana on 10/3/20.
//  Copyright © 2020 Solayman Rana. All rights reserved.
//

import Foundation
import SwiftUI

class Api {
    
    func getData(completion: @escaping ([Model]) -> ()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{
            fatalError("Error")
        }
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            
            let posts = try! JSONDecoder().decode([Model].self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }.resume()
         
    }
}
