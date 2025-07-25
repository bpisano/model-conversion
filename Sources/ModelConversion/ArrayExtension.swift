//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 12/06/2022.
//

import Foundation

public extension Array where Element: ToDtoConvertible {
    var dtos: [Element.DtoModel] {
        map(\.dto)
    }
}

public extension Array where Element: ToAppModelConvertible {
    var appModels: [Element.AppModel] {
        map(\.appModel)
    }
}
