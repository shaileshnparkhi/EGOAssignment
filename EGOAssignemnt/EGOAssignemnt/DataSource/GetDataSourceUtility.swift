//
//  GetDataSource.swift
//  EDG iOS Test
//
//  Created by Shailesh on 09/07/23.
//

import Foundation

class GetDataSourceUtility {

    func getProductData<T:Decodable>(url:URL,resultType:T.Type,completion:@escaping (_ result:T?,_ error:Error?)->Void) {
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: {data,response,error in
            
            if let errorPresent = error{
                completion(nil,errorPresent)
            }else if data != nil && data?.count != 0{
                    do{
                        let response = try JSONDecoder().decode(resultType.self, from: data!)
                        completion(response,nil)
                    }catch(let error){
                        completion(nil,error)
                    }
                }
        }).resume()
    }
}
