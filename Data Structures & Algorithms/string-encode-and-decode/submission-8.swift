class Solution {

    // Encodes a list of strings to a single string
    func encode(_ strs: [String]) -> String {
        var encoded = ""
        for str in strs {
            // Format: "length#string"
            encoded += "\(str.count)#\(str)"
        }
        return encoded
    }
    
    // Decodes a single string back to a list of strings
    func decode(_ str: String) -> [String] {
        var result: [String] = []
        var i = str.startIndex
        
        while i < str.endIndex {
            // Find the '#' delimiter
            var j = i
            while str[j] != "#" {
                j = str.index(after: j)
            }
            
            // Extract the length
            let length = Int(str[i..<j])!
            
            // Move past the '#'
            let start = str.index(after: j)
            let end = str.index(start, offsetBy: length)
            
            // Extract the string of that length
            result.append(String(str[start..<end]))
            
            // Move to the next encoded segment
            i = end
        }
        
        return result
    }
}
