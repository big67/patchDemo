defineClass('ViewController', {
  invalidePSD: function(psd) {
    
            var match = "SELF MATCHES %@"
            var phoneRegex = "^1(3[0-9]|4[57]|5[0-35-9]|7[06-8]|8[0-9])\\d{8}$"
            var predicate = require("NSPredicate").predicateWithFormat(match, phoneRegex)
            return predicate.evaluateWithObject(psd)
        }
})
