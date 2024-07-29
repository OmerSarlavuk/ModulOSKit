//
//  File.swift
//
//
//  Created by Ö.Ş on 22.07.2024.
//

import Foundation
import Alamofire


//MARK: T must be the data type to be deserialized according to the data structure returned from the service.

open class NetworkManager<T: Codable> {

    //MARK: fetch data usage with Alamofire
    
    public static func fetchData(url: String, completion: @escaping ((T?, String) -> Void)) {
        
        AF.request(url, method: .get).response{ response in
            
            if let data = response.data {
                
                do {
                    
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result, "Success")
                    
                } catch {
                    completion(nil, error.localizedDescription)
                }
                
            } else {
                completion(nil, "data did not arrive successfully, please try again")
            }
            
        }
        
    }
    
    //MARK: postData or putData usage with Alamofire
    
    public static func jsonObjectFieldData(url: String, method: HTTPMethod, parameters: Codable, completion: @escaping ((T?, String) -> Void)) {
        
        AF.request(url, method: method, parameters: parameters, encoder: JSONParameterEncoder.default).response { response in
            
            if let data = response.data {
                
                do {
                    
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result, "Success")
                    
                } catch {
                    completion(nil, error.localizedDescription)
                }
                
                
            } else {
                completion(nil, "data did not arrive successfully, please try again")
            }
            
        }
        
    }
    
    //MARK: deleteData usage with Alamofire
    //MARK: Ex -> http://address?queryData=Ex
    
    public static func deleteData(url: String, completion: @escaping ((T?, String) -> Void)) {
        AF.request(url, method: .delete).response { response in
            
            if let data = response.data {
                
                do {
                    
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result, "Success")
                    
                } catch {
                    completion(nil, error.localizedDescription)
                }
                
                
            } else {
                completion(nil, "data did not arrive successfully, please try again")
            }
            
        }
    }
    
    //MARK: deletData usage Alamofire
    //MARK: Ex -> url -> http://address
    //MARK: Parameters -> DeletedObject [FromBody]
    
    public static func deleteData(url: String, parameters: Codable, completion: @escaping ((T?, String) -> Void)) {
        AF.request(url, method: .delete, parameters: parameters, encoder: JSONParameterEncoder.default).response { response in
            
            if let data = response.data {
                
                do {
                    
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result, "Success")
                    
                } catch {
                    completion(nil, error.localizedDescription)
                }
                
            } else {
                completion(nil, "data did not arrive successfully, please try again")
            }
            
        }
    }
    
}



