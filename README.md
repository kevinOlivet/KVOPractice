# KVOPractice
Key Value Observers in the old and new style.

I used this project to explore the differences in Key Value Observing pre-Swift 4 and Swift 4.
It's also an example of using the MVVM design pattern.

There is an enum called whichWay that represents the old way and the new way.

The old way needs 4 things:
1. a context variable // This doesn't seem to work or be needed in Xcode 9 as it demands exclusive access.
2. addObserver in ViewDidLoad
3. override function observeValueforKeyPath, that uses a keyPath to the observed value
4. removeObserver in deinit{}

The new way needs 2 things:
1. token: NSKeyValueObservation? = nil
2. func startObserving() where the value will be observed and changed in a changeHandler block. 
startObserving is called in ViewDidLoad

The new way seems much easier and direct.
