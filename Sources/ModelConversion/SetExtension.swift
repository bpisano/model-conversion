//
//  File.swift
//  ModelConversion
//
//  Created by Benjamin Pisano on 05/01/2025.
//

import Foundation

public extension Set where Element: ToDtoConvertible {
    var dtos: [Element.DtoModel] {
        map(\.dto)
    }
}

public extension Set where Element: ToAppModelConvertible {
    var appModels: [Element.AppModel] {
        map(\.appModel)
    }
}
