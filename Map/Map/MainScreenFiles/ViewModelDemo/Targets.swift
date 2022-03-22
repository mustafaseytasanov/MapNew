//
//  Targets.swift
//  Map
//
//  Created by Nikita on 05.03.2022.
//

import Foundation
import Moya

enum DemoTarget {
    //case nearby
    case fetchUsers(page: Int)
}

extension DemoTarget: TargetType {

    
    var baseURL: URL { return URL(string: "https://reqres.in")! }
    //var baseURL: URL { return URL(string: "https://api.foursquare.com/v3/place")! }
        
    var path: String {
        switch self {
        case .fetchUsers:
            return "/api/users"
        //case .nearby:
        //    return "/nearby"
        }
    }
        
    var method: Moya.Method {
        return .get
    }
        
    var parameters: [String: Any] {
        
        switch self {
        case .fetchUsers(page: let page):
            return ["page": page]

        }
        //return ["Authorization": "fsq3KHEsAFWlULlhyqnzd9HlIJajryG97+KckowgycT7Zdw="]
    }
        
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
        
    var sampleData: Data {
        return Data()
    }
        
    var task: Task {
        return .requestParameters(
            parameters: self.parameters,
            encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return [:]
    }

    
    //var headers: [String : String]? {
    //    return ["Authorization": "fsq3KHEsAFWlULlhyqnzd9HlIJajryG97+KckowgycT7Zdw="]
    //}
}
