//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 12/06/2022.
//

import Foundation

public extension Array where Element: ToPublicModelConvertible {
    var apiModels: [Element.PublicModel] {
        compactMap(\.publicModel)
    }
}

public extension Array where Element: ToAppModelConvertible {
    var appModels: [Element.AppModel] {
        compactMap(\.appModel)
    }
}
