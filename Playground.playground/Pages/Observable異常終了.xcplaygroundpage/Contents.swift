//: [Previous](@previous)

import Foundation
import RxSwift

public enum TestError : Error {
    case test
}

let sequence = Observable.of(1, 2)
    .flatMap { string -> Observable<String> in
        print("flatMap: \(string)")
        let observable = Observable<String>.create { observer in
            observer.onNext("A")
            observer.onError(TestError.test)
            observer.onNext("B")

            return Disposables.create() {
                print("Dispose Action")
            }
        }
        return observable
}

_ = sequence
    .subscribe(onNext: {
        print("onNext: \($0)")
    }, onError: {
        print("onError: \($0)")
    }, onCompleted: {
        print("onCompleted:")
    }, onDisposed: {
        print("onDisposed:")
    })
