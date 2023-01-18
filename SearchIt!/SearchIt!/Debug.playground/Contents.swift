let s = "Seattle,WA"
let i = s.firstIndex(of: ",")
let b = s[..<i!]
let city = String(b)
let e = s.index(i!, offsetBy: 1)
let e2 = s[e...]
let state = String(e2)
print(city)
print(state)
