import Foundation
final class EmailValidator {

    func validate(_ input: String?) -> Bool {
      guard let input = input else{return false}
        guard
            let regex = try? NSRegularExpression(
                pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}",
                options: [.caseInsensitive]
            )
        else {
            assertionFailure("Regex not valid")
            return false
        }

        let regexFirstMatch = regex
            .firstMatch(
                in: input,
                options: [],
                range: NSRange(location: 0, length: input.count)
            )

        return regexFirstMatch != nil
    }
}
