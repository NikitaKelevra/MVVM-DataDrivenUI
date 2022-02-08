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
    func error()
}

final class MainViewModel:MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func error() { //сразу выдача ошибки
        updateViewData?(.failure(ViewData.Data(icon: "failure",
                                               title: "Error!",
                                               description: "Data was not found.",
                                               numberPhone: nil)))
    }
    
    public func startFetch() {
        //сразу выдача Полученных данных
//        updateViewData?(.success(ViewData.Data(icon: "succes",
//                                               title: "Success",
//                                               description: "Good",
//                                               numberPhone: nil)))
        
        // Проходит все три этапа с задержкой в 3 секунды - загрузка/получение/ошибка
        //start loading
        self.updateViewData?(.loading(ViewData.Data(icon: nil,
                                                    title: nil,
                                                    description: nil,
                                                    numberPhone: nil)))
        
        //parse data
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "success",
                                                         title: "Успех!",
                                                         description: "Данные загружены.",
                                                         numberPhone: nil)))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {[weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "failure",
                                                         title: "Ошибка!",
                                                         description: "Данные не получены.",
                                                         numberPhone: nil)))
        }
    }
}
