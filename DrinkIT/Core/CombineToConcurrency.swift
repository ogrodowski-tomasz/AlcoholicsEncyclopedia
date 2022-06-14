//
//  CombineToConcurrency.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 11/06/2022.
//

import Combine
import Foundation

extension Publisher {
    var asAsyncStream: AsyncThrowingStream<Output, Error> {
        AsyncThrowingStream(Output.self) { continuation in
            let cancellable = sink { completion in
                switch completion {
                case .finished:
                    continuation.finish()
                case .failure(let error):
                    continuation.finish(throwing: error)
                }
            } receiveValue: { output in
                continuation.yield(output)
            }

            continuation.onTermination = { _ in cancellable.cancel() }
        }
    }
}
