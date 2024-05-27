//
//  ToAppModelConvertible.swift
//  
//
//  Created by Benjamin Pisano on 12/06/2022.
//

import Foundation

public protocol ToAppModelConvertible {
    associatedtype AppModel
    
    var appModel: AppModel { get }
}
