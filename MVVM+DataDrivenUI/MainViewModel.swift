//
//  MainViewModel.swift
//  MVVM+DataDrivenUI
//
//  Created by Сперанский Никита on 08.02.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData)->())? { get set }
    func startFetch()
}

final class MainViewModel:MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func startFetch() {
        //start loading
        updateViewData?(.loading(ViewData.Data(icon: nil,
                                               title: nil,
                                               description: nil,
                                               numberPhone: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "succes",
                                                         title: "Success",
                                                         description: "Good",
                                                         numberPhone: nil)))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {[weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "error",
                                                         title: "Error",
                                                         description: "Not user",
                                                         numberPhone: nil)))
        }
    }
}
