//
//  WebView.swift
//  hnNews
//
//  Created by Autthawigorn Yortpiboot on 13/2/2567 BE.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}


