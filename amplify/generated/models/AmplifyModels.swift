// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "0c1acbc53f081789efef12d63ae7ead0"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: AmplifyFriend.self)
    ModelRegistry.register(modelType: AmplifyGroup.self)
  }
}