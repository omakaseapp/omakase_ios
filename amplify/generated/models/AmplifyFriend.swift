// swiftlint:disable all
import Amplify
import Foundation

public struct AmplifyFriend: Model {
  public let id: String
  public var firstName: String
  public var lastName: String
  public var profilePhotoURL: String
  
  public init(id: String = UUID().uuidString,
      firstName: String,
      lastName: String,
      profilePhotoURL: String) {
      self.id = id
      self.firstName = firstName
      self.lastName = lastName
      self.profilePhotoURL = profilePhotoURL
  }
}