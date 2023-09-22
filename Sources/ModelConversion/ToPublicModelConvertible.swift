//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 12/06/2022.
//

import Foundation

public protocol ToPublicModelConvertible {
    associatedtype PublicModel
    
    var publicModel: PublicModel? { get }
}
