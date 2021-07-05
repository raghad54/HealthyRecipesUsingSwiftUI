//
//  APIManger.swift
//  GitHubRepoTask
//
//  Created by Raghad's Mac on 05/07/2021.
//

import Foundation
import SwiftyJSON


class APIClient {


    static let baseUrl = "https://api.github.com/"

    typealias parameters = [String:Any]

    enum ApiResult {
        case success([GitHubRepoListModel])
        case failure(RequestError)
    }
    enum HTTPMethod: String {
        case options = "OPTIONS"
        case get     = "GET"
        case head    = "HEAD"
        case post    = "POST"
        case put     = "PUT"
        case patch   = "PATCH"
        case delete  = "DELETE"
        case trace   = "TRACE"
        case connect = "CONNECT"
    }
    enum RequestError: Error {
        case unknownError
        case connectionError
        case authorizationError(JSON)
        case invalidRequest
        case notFound
        case invalidResponse
        case serverError
        case serverUnavailable
    }
    static func requestData(url:String,method:HTTPMethod,parameters:parameters?,completion: @escaping (ApiResult)->Void) {

        let header =  ["Content-Type": "application/x-www-form-urlencoded"]

        var urlRequest = URLRequest(url: URL(string: baseUrl+url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        urlRequest.allHTTPHeaderFields = header
        urlRequest.httpMethod = method.rawValue
        if let parameters = parameters {
            let parameterData = parameters.reduce("") { (result, param) -> String in
                return result + "&\(param.key)=\(param.value as! String)"
            }.data(using: .utf8)
            urlRequest.httpBody = parameterData
        }
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error)
                completion(ApiResult.failure(.connectionError))
            }else if let data = data ,let responseCode = response as? HTTPURLResponse {
                do {
//                    let responseJson = try JSON(data: data)
//                    print("responseCode : \(responseCode.statusCode)")
//                    print("responseJSON : \(responseJson)")
                    let repoList = try! JSONDecoder().decode([GitHubRepoListModel].self, from: data)
                    print([repoList].count)
                    switch responseCode.statusCode {
                    case 200:
                        completion(ApiResult.success(repoList))
                    case 400...499:
                        completion(ApiResult.failure(.authorizationError(JSON(rawValue: repoList) ?? "")))
                    case 500...599:
                    completion(ApiResult.failure(.serverError))
                    default:
                        completion(ApiResult.failure(.unknownError))
                        break
                    }
                }
                catch let parseJSONError {
                    completion(ApiResult.failure(.unknownError))
                    print("error on parsing request to JSON : \(parseJSONError)")
                }
            }
        }.resume()
    }
}






//public typealias JSON = [String: Any]
//public typealias HTTPHeaders = [String: String]
//
//public enum RequestMethod: String {
//    case get = "GET"
//    case post = "POST"
//    case put = "PUT"
//    case delete = "DELETE"
//}
//
//public class APIClient {
//    static let shared = APIClient()
//
//    public func sendRequest<T: Decodable>(for: T.Type = T.self,
//                                          url: String,
//                                          method: RequestMethod,
//                                          headers: HTTPHeaders? = nil,
//                                          body: JSON? = nil,
//                                          completion: @escaping (Result<T, Error>) -> Void) {
//
//        return sendRequest(url: url, method: method, headers: headers, body:body, completion: completion) { decoder, data in try decoder.decode(T.self, from: data) }
//    }
//
////    public func sendRequest<T: Decodable>(for: [T].Type = [T].self,
////                                          url: String,
////                                          method: RequestMethod,
////                                          headers: HTTPHeaders? = nil,
////                                          body: JSON? = nil,
////                                          completion: @escaping (Result<[T]>) -> Void) {
////
////        return sendRequest(url: url, method: method, headers: headers, body:body, completion: completion) { decoder, data in try decoder.decode([T].self, from: data) }
////    }
//
//    private func sendRequest(_ url: String,
//                             method: RequestMethod,
//                             headers: HTTPHeaders? = nil,
//                             body: JSON? = nil,
//                             completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
//        let url = URL(string: url)!
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = method.rawValue
//
//        if let headers = headers {
//            urlRequest.allHTTPHeaderFields = headers
//            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        }
//
//        if let body = body {
//            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
//        }
//
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: urlRequest) { data, response, error in
//            completionHandler(data, response, error)
//        }
//
//        task.resume()
//    }
//
//    private func sendRequest<T>(url: String,
//                                method: RequestMethod,
//                                headers: HTTPHeaders? = nil,
//                                body: JSON? = nil,
//                                completion: @escaping (Result<T,Error>) -> Void,
//                                decodingWith decode: @escaping (JSONDecoder, Data) throws -> T) {
//        return sendRequest(url, method: method, headers: headers, body:body) { data, response, error in
//            guard let data = data else {
//                return completion(.failure((error ?? NSError(domain: "SomeDomain", code: -1, userInfo: nil)) as NSError))
//            }
//            do {
//                let decoder = JSONDecoder()
//                // asking the custom decoding block to do the work
//                try completion(.success(decode(decoder, data)))
//            } catch let decodingError {
//                completion(.failure(decodingError as NSError))
//            }
//        }
//    }
//
//}
