/*
 #2 This problem was asked by Microsoft.
 
 Describe and give an example of each of the following types of polymorphism:
 
 Ad-hoc polymorphism
 Parametric polymorphism
 Subtype polymorphism
 */

// AD HOC Polymorphism

/*
 From What I've read, Adhoc polymorphism refers to function overloading, or operator overloading
 
 */

precedencegroup DoubleAdd {
    higherThan: ComparisonPrecedence
    associativity: left
}

infix operator ++: DoubleAdd

func ++<A: Numeric> (_ lhs: A, _ rhs: A) -> A {
    return lhs + rhs + rhs
}

func addTwice<A: Numeric>(_ lhs: A, _ rhs: A) -> A {
    return lhs ++ rhs
}

func testAdHoc() {
    assert(5 ++ 1 == 7, "Doesn't work with Ints")
    assert(5.1 ++ 1 == 7.1, "Doesn't work with Floats")
    print("✅ AdHoc Polymorphism Test Passed")
}

testAdHoc()

// Parametric polymorphism:

// Implementing a Map on Result

func map1<A, B, Error>(_ f: @escaping (A) -> B) -> (Result<A, Error>) -> Result<B, Error> {
    return { result in
        switch result {
        case let .success(a):
            return .success(f(a))
        case let .failure(error):
            return .failure(error)
        }
    }
}

func testParametricPolymorphism() {
    let networkResult: Result<Int, Error> = .success(42)
    let stringResult = map1(String.init)(networkResult)
    switch stringResult {
    case let .success(stringValue):
        assert(stringValue == "42", "Custom Map on Result failed")
    case .failure:
        assertionFailure("Failed to convert Int to String")
    }
    print("✅ Parametric Polymorphism Tests Passed")
}

// Subtype Polymorphism: You generalize a problem from the outside, and then sub type it to solve special cases

struct VideoPlayerOptions {
    var mute: Bool = true
    var playbackTime: CMTime = .zero
}
// Type: Generalized Type
protocol VideoPlayable: AnyObject {
    func playVideo(with options: VideoPlayerOptions)
    func pauseVideo() -> VideoPlayerOptions
}

import AVFoundation

extension AVPlayer {
    var playbackOptions: VideoPlayerOptions {
        get {
            return VideoPlayerOptions(mute: isMuted, playbackTime: currentItem?.currentTime() ?? .zero)
        }
        set {
            isMuted = newValue.mute
            currentItem?.seek(to: newValue.playbackTime, completionHandler: nil)
        }
    }
}

// SubType 1: Specialized for AV Player
protocol AVVideoPlayable: VideoPlayable {
    var player: AVPlayer { get }
}

extension AVVideoPlayable {
    func playVideo(with options: VideoPlayerOptions) {
        player.playbackOptions = options
        player.play()
    }
    func pauseVideo() -> VideoPlayerOptions {
        player.pause()
        return player.playbackOptions
    }
}

// SubType 2: Specialized for ASP Video Player Class/Library

class ASPVideoPlayer {
    var playbackOptions = VideoPlayerOptions()
    init() {}
    func play() {}
    func pause() {}
}

protocol ASPVideoPlayable: VideoPlayable {
    var player: ASPVideoPlayer { get }
}

extension ASPVideoPlayable {
    func playVideo(with options: VideoPlayerOptions) {
        player.play()
    }
    
    func pauseVideo() -> VideoPlayerOptions {
        player.pause()
        return player.playbackOptions
    }
}
