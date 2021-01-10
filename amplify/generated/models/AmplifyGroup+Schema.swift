// swiftlint:disable all
import Amplify
import Foundation

extension AmplifyGroup {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case emoji
    case name
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let amplifyGroup = AmplifyGroup.keys
    
    model.pluralName = "AmplifyGroups"
    
    model.fields(
      .id(),
      .field(amplifyGroup.emoji, is: .required, ofType: .string),
      .field(amplifyGroup.name, is: .required, ofType: .string)
    )
    }
}