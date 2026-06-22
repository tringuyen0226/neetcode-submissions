class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        if strs.count == 1 {
            var result = strs.first.map { $0.isEmpty ? [] : [$0] } ?? []
            return [result]
        }

        var group = [String: [String]]()

        for str in strs {
            if let values = group[String(str.sorted())], isAnagrams(str, t: values[0]) {
                var newValues = values
                newValues.append(str)
                group[String(str.sorted())] = newValues
            } else {
                group[String(str.sorted())] = [str]
            }
        }

        return group.values.compactMap { $0 }
    }

    private func isAnagrams(_ s: String, t: String) -> Bool {
        return s.sorted() == t.sorted() && s.count == t.count
    }

}
