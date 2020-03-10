//
//  ContentView.swift
//  NewsSwiftUI
//
//  Created by Solayman Rana on 10/3/20.
//  Copyright © 2020 Solayman Rana. All rights reserved.

import SwiftUI


struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    
@State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) {item in
            HStack{
                Image("img")
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
                    .clipped()
                VStack(alignment: .leading, spacing: 20){
                    
                    Text(item.trackName)
                    
                    HStack(spacing: 10){
                        Text ("#Tech")
                            .padding(.all, 2.0)
                            .background(t.yellow
                                .font(.body))
                            .font(.system(size: 12))
                        Image("group10")
                            .frame(width: 18.0, height: 15.0)
                        Spacer()
                        Image(systemName: "bookmark")
                            .frame(width: 20, height: 20)
                        
                    }
                }
            }
        }.onAppear(perform: loaddata)
    }
    func loaddata(){
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
