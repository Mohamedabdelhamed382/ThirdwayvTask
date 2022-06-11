//
//  ProductsInteractor.swift
//  ThirdwayvTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 10/06/2022.
//

import Foundation
class ProductsInteractor{
    let file = "file.txt"
    var text = ""
   
        func request(completion: @escaping (Result<[ProductsData],Error>) -> Void) {
            guard let url = URL(string: "https://jsonkeeper.com/b/Q7L3") else { return print("Error in URL Of API")}
            let task  = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data , error == nil else { return }
                self.text = data.toString()
                do {
                    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                        let fileURL = dir.appendingPathComponent(self.file)
                        do {
                            try self.text.write(to: fileURL, atomically: false, encoding: .utf8)
                        }
                        catch {}
                    }
                let results = try JSONDecoder().decode([ProductsData].self, from: data)
                    completion(.success(results))
                }catch(let error){
                    completion(.failure(error))
                }
            }
            task.resume()
        }
        
}
