import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
//    func fetchData() {
//        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, reponse, error in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do {
//                            let results =  try decoder.decode(Result.self, from: safeData)
//                            DispatchQueue.main.async {
//                                self.posts = results.hits
//                            }
//                            
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
    
    
    func fetchData() {
            guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else {
                print("Invalid URL")
                return
            }
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { [weak self] data, response, error in
                guard error == nil else {
                    print("Error fetching data: \(error!)")
                    return
                }
                
//                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//                    print("Invalid response")
//                    return
//                }
                
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(Result.self, from: data)
                    DispatchQueue.main.async {
                        self?.posts = results.hits
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            task.resume()
        }
    
}


