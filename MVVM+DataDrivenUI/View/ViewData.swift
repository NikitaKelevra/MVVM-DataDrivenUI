//
//  File.swift
//  MVVM+DataDrivenUI
//
//  Created by Сперанский Никита on 08.02.2022.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone :String?
    }
    
}
