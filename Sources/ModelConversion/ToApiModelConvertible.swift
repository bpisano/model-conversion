//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 12/06/2022.
//

import Foundation

public protocol ToApiModelConvertible {
    associatedtype ApiModel
    
    var apiModel: ApiModel? { get }
}
