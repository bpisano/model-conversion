//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 12/06/2022.
//

import Foundation
import Combine

@available(iOS 13.0, *)
public extension Publisher where Output: ToApiModelConvertible {
    func toApiModel() -> AnyPublisher<Output.ApiModel, Failure> {
        compactMap(\.apiModel)
            .eraseToAnyPublisher()
    }
}

@available(iOS 13.0, *)
public extension Publisher where Output: ToAppModelConvertible {
    func toAppModel() -> AnyPublisher<Output.AppModel, Failure> {
        compactMap(\.appModel)
            .eraseToAnyPublisher()
    }
}
