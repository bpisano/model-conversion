//
//  ToDtoConvertible.swift
//  
//
//  Created by Benjamin Pisano on 12/06/2022.
//

import Foundation

public protocol ToDtoConvertible {
    associatedtype DtoModel
    
    var dto: DtoModel { get }
}
