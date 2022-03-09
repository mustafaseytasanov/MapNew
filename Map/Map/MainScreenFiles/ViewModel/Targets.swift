//
//  Targets.swift
//  Map
//
//  Created by Nikita on 05.03.2022.
//

import Foundation
import Moya

enum DemoTarget {
    case fetchUsers(page: Int)
}

extension DemoTarget: TargetType {

    
    var baseURL: URL { return URL(string: "https://reqres.in")! }
    //var baseURL: URL { return URL(string: "https://api.foursquare.com/v2/venues")! }
    
    var path: String {
        switch self {
        case .fetchUsers:
            return "/api/users"
        //case .fetchUsers:
        //    return "/search"
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
}
