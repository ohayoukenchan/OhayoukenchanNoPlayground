import Foundation
import RxSwift

public enum TestError : Error {
    case test
}

let sequenceThatErrors = Observable<String>.create { observer in
    observer.onNext("A")
    observer.onError(TestError.test)
    observer.onNext("B")
    observer.onCompleted()

    return Disposables.create()
}

_ = sequenceThatErrors
    .catchErrorJustReturn("Z")
    .subscribe(onNext: {
        print("onNext: \($0)")
    }, onError: {
        print("onError: \($0)")
    }, onCompleted: {
        print("onCompleted")
    }, onDisposed: {
        print("onDisposed")
    })

var str = "Hello, playground"

//: [Next](@next)


//: [Next](@next)

