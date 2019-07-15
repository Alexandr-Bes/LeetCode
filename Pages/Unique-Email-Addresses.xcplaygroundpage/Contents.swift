
/*  Detect unique email and return the number of them.

If you add periods ('.') between some characters in the local name part of an email address, mail sent there will be forwarded to the same address without dots in the local name.  For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.  (Note that this rule does not apply for domain names.)

If you add a plus ('+') in the local name, everything after the first plus sign will be ignored. This allows certain emails to be filtered, for example m.y+name@email.com will be forwarded to my@email.com.  (Again, this rule does not apply for domain names.)

    https://leetcode.com/problems/unique-email-addresses/
*/

import Foundation

class SolutionSecond {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var emailSet = Set<String>()

        for email in emails {
            let arrayOfEmail = email.split(separator: "@")
            guard let localName = arrayOfEmail[0].split(separator: "+").first?.replacingOccurrences(of: ".", with: "") else { return 0}
            let domain = "@" + arrayOfEmail[1]
            emailSet.insert(localName + domain)
        }
        return emailSet.count
    }
}


class SolutionFirst {

    // Returns domain
    func domain(str: String) -> String {
        var result = ""
        for i in str.reversed() {
            if i == "@" {
                break
            }
            result += String(i)
        }
        result = "@" + result.reversed()
        return result
    }

    // Returns filtered local name
    func transformLocalName(word: String) -> String {
        var transformed = ""
        for i in word {
            if i == "+" {
                break
            }
            transformed += String(i)
        }
        return transformed.filter { !".".contains($0) }
    }

    // Returns String without domain
    func wordWithoutDomain(email: String) -> String {
        var emailWithoutDomain = ""
        for i in email {
            if i == "@" {
                break
            }
            emailWithoutDomain += String(i)
        }
        return emailWithoutDomain
    }

    // Final function
    func numUniqueEmails(_ emails: [String]) -> Int {
        var array = [String]()
        var result = [String]()
        var count = 0

        for str in emails {
            let domainName = domain(str: str)
            let filteredLocalName = transformLocalName(word: wordWithoutDomain(email: str))
            let result = filteredLocalName + domainName
            array.append(result)
        }

        for i in array {
            if !result.contains(i) {
                result.append(i)
                count += 1
            }
        }
        return count
    }
}
