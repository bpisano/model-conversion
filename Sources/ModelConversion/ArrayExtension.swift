//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 12/06/2022.
//

import Foundation

public extension Array where Element: ToApiModelConvertible {
    var apiModels: [Element.ApiModel] {
        compactMap(\.apiModel)
    }
}

public extension Array where Element: ToAppModelConvertible {
    var appModels: [Element.AppModel] {
        compactMap(\.appModel)
    }
}
