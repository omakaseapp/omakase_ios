// swiftlint:disable all
import Amplify
import Foundation

public struct AmplifyGroup: Model {
  public let id: String
  public var emoji: String
  public var name: String
  
  public init(id: String = UUID().uuidString,
      emoji: String,
      name: String) {
      self.id = id
      self.emoji = emoji
      self.name = name
  }
}