//
//  File.swift
//  ModelConversion
//
//  Created by Benjamin Pisano on 06/01/2025.
//

import Foundation

@available(iOS 18.0, *)
@available(tvOS 18.0, *)
@available(watchOS 11.0, *)
@available(macOS 15.0, *)
public struct AsyncDtoSequence<Sequence: AsyncSequence>: AsyncSequence where Sequence.Element: ToDtoConvertible {
    public struct Iterator: AsyncIteratorProtocol {
        var iterator: Sequence.AsyncIterator

        init(sequence: Sequence) {
            iterator = sequence.makeAsyncIterator()
        }

        public mutating func next() async throws -> Sequence.Element.DtoModel? {
            try await iterator.next()?.dto
        }
    }

    private let sequence: Sequence

    init(_ sequence: Sequence) {
        self.sequence = sequence
    }

    public func makeAsyncIterator() -> Iterator {
        Iterator(sequence: sequence)
    }
}

@available(iOS 18.0, *)
@available(tvOS 18.0, *)
@available(watchOS 11.0, *)
@available(macOS 15.0, *)
extension AsyncDtoSequence: Sendable where Sequence: Sendable, Sequence.Element: Sendable { }

@available(iOS 18.0, *)
@available(tvOS 18.0, *)
@available(watchOS 11.0, *)
@available(macOS 15.0, *)
public extension AsyncSequence where Element: ToDtoConvertible {
    var dtos: AsyncDtoSequence<Self> {
        AsyncDtoSequence(self)
    }
}
