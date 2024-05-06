//
//  ContentView.swift
//  hnNews
//
//  Created by Autthawigorn Yortpiboot on 12/2/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { everyPost in
                NavigationLink(destination: DetailView(url: everyPost.url)){
                    HStack {
                        Text("\(everyPost.points)") // ลองใช้ String Interpolation
                            .frame(width: 40)
                        
                        //Text(String(everyPost.points))  // วิธี Angela
                        Spacer().frame(width: 16)
                        Text(everyPost.title)
                    }
                }
            }
            .navigationTitle("H4XOR NEWS")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}


#Preview {
    ContentView()
}



//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")
//]
