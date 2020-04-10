import UIKit
import RxSwift

var str = "Hello, playground"

let sequence = Observable.of(1, 2)
    .flatMap{ string -> Observable<String> in
        print("flatmap: \(string)")
        let obserbable = Observable<String>.create { observer in
            observer.onNext("A")

            observer.onCompleted()
            observer.onNext("B")
            observer.onNext("C")

            return Disposables.create() {
                print("Dispose Action:")
            }
        }
        return obserbable
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
    }

)

