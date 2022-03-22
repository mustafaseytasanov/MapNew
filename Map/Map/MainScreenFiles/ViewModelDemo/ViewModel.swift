//
//  ViewModel.swift
//  Map
//
//  Created by Nikita on 05.03.2022.
//

import Moya
import Foundation

protocol DemoViewModelProtocol: AnyObject {
    var dataStorage: [UserDTO] { get }
    var updator: () -> Void { get set }
    func loadMore()
    func reload()
}

final class DemoViewModel: DemoViewModelProtocol {
    var dataStorage: [UserDTO] = []
    var updator: () -> Void = {}
    private var totalPages: Int = 0
    private var currentPage: Int = 0
    private let provider = MoyaProvider<DemoTarget>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: [.verbose]))])

    func loadMore() {
        currentPage += 1
        //nearby()
        fetchUsers(page: currentPage)
        
    }
    
    func reload() {
        currentPage = 1
        fetchUsers(page: currentPage)
        //nearby()
    }
    
    private func fetchUsers(page: Int) {
        provider.request(.fetchUsers(page: page)) { [weak self] result in
                switch result {
                case .success(let response):
                    let mapped = try? response.map(UsersResponse.self)
                    self?.dataStorage = mapped?.data.map { UserDTO(from: $0) } ?? []
                    self?.updator()
                case .failure(let error):
                    print("Something went wrong: \(error)")
                }
            }
    }
    
    // does not support pagination
    /*
    private func nearby() {
        provider.request(.nearby) { [weak self] result in
            switch result {
            case .success(let response):
                let mapped = try? response.map(UsersResponse.self)
                self?.dataStorage = mapped?.data.map { UserDTO(from: $0) } ?? []
                self?.updator()
            case .failure(let error):
                print("Something went wrong: \(error)")
            }
        }
    }*/
}
