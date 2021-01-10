// swiftlint:disable all
import Amplify
import Foundation

extension AmplifyFriend {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case firstName
    case lastName
    case profilePhotoURL
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let amplifyFriend = AmplifyFriend.keys
    
    model.pluralName = "AmplifyFriends"
    
    model.fields(
      .id(),
      .field(amplifyFriend.firstName, is: .required, ofType: .string),
      .field(amplifyFriend.lastName, is: .required, ofType: .string),
      .field(amplifyFriend.profilePhotoURL, is: .required, ofType: .string)
    )
    }
}