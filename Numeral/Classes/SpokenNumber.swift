//
//  SpokenNumber.swift
//  Numbers
//
//  Created by Stephan Jancar on 11.12.17.
//  Copyright © 2017 Stephan Jancar. All rights reserved.
//

import Foundation
import BigInt

public extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

public extension String {
	func superscript() -> String {
//		let s = "⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ⁺ ⁻ ⁼ ⁽ ⁾"
		var ans = ""
		for c in self {
			switch String(c) {
			case "0":
				ans = ans + "⁰"
			case "1":
				ans = ans + "¹"
			case "2":
				ans = ans + "²"
			case "3":
				ans = ans + "³"
			case "4":
				ans = ans + "⁴"
			case "5":
				ans = ans + "⁵"
			case "6":
				ans = ans + "⁶"
			case "7":
				ans = ans + "⁷"
			case "8":
				ans = ans + "⁸"
			case "9":
				ans = ans + "⁹"
			case "+":
				ans = ans + "⁺"
			case "-":
				ans = ans + "⁻"
			case "*":
				ans = ans + "⋅"
			case "(":
				ans = ans + "⁽"
			case ")":
				ans = ans + "⁾"
			default:
				ans = ans + String(c)
			}
		}
		return ans
	}
	
}

public class SpokenNumber {
	public static let shared = SpokenNumber()
	private init() {
		
	}
	
	let small = ["ze\u{200B}ro", "one", "two", "three", "four", "five", "six", "se\u{200B}ven", "eight", "nine", "ten", "eleven", "twelve", "thir\u{00AD}teen", "four\u{00AD}teen", "fif\u{00AD}teen", "six\u{00AD}teen", "seven\u{00AD}teen","eigh\u{00AD}teen", "nine\u{00AD}teen"]
	let tens = [ "", "", "twen\u{00AD}ty", "thir\u{00AD}ty", "for\u{00AD}ty", "fif\u{00AD}ty", "six\u{00AD}ty", "seven\u{00AD}ty", "eigh\u{00AD}ty", "nine\u{00AD}ty" ]
	let bigger = [ "", "thou\u{00AD}sand", "mi\u{00AD}llion", "bi\u{00AD}llion" , "tri\u{00AD}llion", "qua\u{00AD}drillion", "quin\u{00AD}tilion","sex\u{00AD}tillion","sep\u{00AD}tillion","oct\u{00AD}illion","No\u{00AD}nillion","De\u{00AD}cillion","Undecillion",   "Duo\u{00AD}decillion","Tre\u{00AD}decillion","Quattuor\u{00AD}decillion","Quin\u{00AD}decillion","Sex\u{00AD}decillion","Septen\u{00AD}decillion","Octo\u{00AD}decillion","Novem\u{00AD}decillion","Vigin\u{00AD}tillion"]
	let hundred = "hun\u{00AD}dred"
	let soft = "\u{00AD}"
	public func spoken(n: BigUInt) -> String {
		if n < 20 { return small[Int(n)] }
		if n < 100 {
			var str = tens[Int(n) / 10]
			if n % 10 > 0 {
				str = str + soft + small[Int(n) % 10]
			}
			return str
		}
		if n < 1000 {
			var ans = small[Int(n) / 100] + " " + soft + hundred
			if n % 100 > 0 {
				ans = ans + " and " + spoken(n: n % 100)
			}
			return ans
		}
		
		var (divisor,pot) = (BigUInt(1),0)
		while n / (1000*divisor) > 0 {
			divisor = divisor * 1000
			pot += 3
		}
		let nn = n / divisor
        var ans = spoken(n: nn)
        
        if pot / 3 >= bigger.count {
            let append = SpokenNumberLargePrefixer.shared.prefix(illion: pot/3 - 1)
            ans = ans + " " + append
        } else {
            ans = ans + " " + bigger[pot/3]
        }
        
		if n % divisor > 0 {
			ans = ans + ", " + spoken(n: n % divisor)
		}
		return ans
	}
}

public class SpokenNumberFrench {
	public static let shared = SpokenNumberFrench()
	private init() {
		
	}
	
	let small = ["zéro", "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix", "onze", "douze", "treize", "quatorze", "quinze", "seize", "dix-sept","dix-huit", "dix-neuf"]
	let tens = [ "", "", "vingt", "trente", "quarante", "cin\u{00AD}quante", "soixante", "", "quatre-vingts", "quatre-vingt-dix"]
	let seventy = ["soixante-dix", "soixante et onze", "soixante-douze", "soixante-treize", "soixante-quatorze", "soixante-quinze", "soixante-seize", "soixante-dix-sept","soixante-dix-huit", "soixante-dix-neuf"]
	let eighty = ["quatre-vingt", "quatre-vingt-un", "quatre-vingt-deux", "quatre-vingt-trois", "quatre-vingt-quatre", "quatre-vingt-cinq", "quatre-vingt-six", "quatre-vingt-sept", "quatre-vingt-huit", "quatre-vingt-neuf", "quatre-vingt-dix",]

	let ninety = ["quatre-vingt-dix", "quatre-vingt-onze", "quatre-vingt-douze", "quatre-vingt-treize", "quatre-vingt-quatorze", "quatre-vingt-quinze", "quatre-vingt-seize", "quatre-vingt-dix-sept","quatre-vingt-dix-huit", "quatre-vingt-dix-neuf"]


	let bigger = ["mi\u{00AD}llion", "bi\u{00AD}llion" , "tri\u{00AD}llion", "qua\u{00AD}drillion", "quin\u{00AD}tilion","sex\u{00AD}tillion","sep\u{00AD}tillion","oct\u{00AD}illion","No\u{00AD}nillion"]
	let bigger3 = ["mi\u{00AD}lliard", "bi\u{00AD}lliard" , "tri\u{00AD}lliard", "qua\u{00AD}drilliard", "quin\u{00AD}tiliard","sex\u{00AD}tilliard","sep\u{00AD}tilliard","oct\u{00AD}illiard","No\u{00AD}nilliard"]
	let hundred = "cent"
	let thousand = "mille"
	let soft = "\u{00AD}"
	
	public func spoken(n: BigUInt) -> String {
		if n < 20 { return small[Int(n)] }
		if n >= 70 && n<80 {
			return seventy[Int(n)-70]
		}
		if n >= 80 && n<90 {
			return eighty[Int(n)-80]
		}
		if n >= 90 && n<100{
			return ninety[Int(n)-90]
		}
		if n < 100 {
			var str = tens[Int(n) / 10]
			switch Int(n) % 10 {
			case 0:
				break
			case 1:
				str = str + " et un"
			default:
				str = str + "-" + small[Int(n) % 10]
			}
			return str
		}
		if n == 100 {
			return hundred
		}
		if n < 200 {
            let ans = hundred + "-" + spoken(n: n % 100)
			return ans
		}
		if n < 1000 {
			var ans = small[Int(n)/100] + " " + hundred
			if n % 100 > 0 { ans += " " + spoken(n: n % 100) }
			return ans
		}
		if n == 1000 { return thousand }
		if n < 1000000 {
			var ans = ""
			if n / 1000 > 1 { ans = spoken(n: n / 1000) + " " }
			ans = ans + thousand
			if n % 1000 == 1 { return ans + " et un" }
			if n % 1000 == 0 { return ans }
			ans = ans + " " + spoken(n: n % 1000)
			return ans
		}
		
        var (test,index,ans,_) = (BigUInt(1000000),0,"",BigUInt(0))
		repeat {
			if n>=test {
				let prefix = n / test
				if prefix < 1000 {
					ans = spoken(n: prefix) + " " + bigger[index]
					if n % test > 0 {
						ans = ans + " " + spoken(n: n % test)
					}
					return ans
				}
			}
			test = test * 1000
			if n>=test {
				let prefix = n / test
				if prefix < 1000 {
					ans = spoken(n: prefix) + " " + bigger3[index]
					if n % test > 0 {
						ans = ans + " " + spoken(n: n % test)
					}
					return ans
				}
			}
			test = test * 1000
			index = index + 1
		} while index < min(bigger.count,bigger3.count)
		return "myriades"
	}
}

public class SpokenNumberLargePrefixer {
    
    public static let shared = SpokenNumberLargePrefixer()
    private init() {
        
    }

	let bstr = ["","mi","bi","tri","quadri","quinti","sexti","septi","octi","noni","deci","undeci","Duodeci","Tredeci","Quattuordeci","Quinquadeci","Sedecillion","Septendeci","Octodeci","Novendeci","Viginti"]
	let estr = ["","un","duo","tre","quattor","quin","se","septe","octo","nove"]
	let dstr = ["","deci","viginti","triginta","quadriginta","quinquaginta","sexaginta","septuaginta","octoginta","nonaginta"]
	let hstr = ["","centi","ducenti","trecenti","quadringenti","quingenti","sescenti","septingenti","octingenti","nongenti"]
	let illionstr = "illion"
	
	public func illionAppender(_ str : String) -> String {
//        return str + illionstr
		guard let last = str.last else { return str + illionstr }
		switch last {
		case "a","e","i","o","u","A","E","I","O","U":
			return str.dropLast() + illionstr
		default:
			return str + illionstr
		}
	}
	
	public func prefixer(n: BigUInt) -> String {
		let pot = BigUInt(1000)
		var (test,yllion) = (BigUInt(1000000),0)
		if n < test { return "" }
		repeat {
			if test >= n {
				let ans = prefix(illion: yllion)
				return ans
			}
			(test,yllion) = (test * pot,yllion+1)
		} while yllion <= 999
		return "zillion"
	}
    
    public func powerstr(nth: Int) -> String {
        switch nth {
        case 0:
            return "one"
        case 1:
            return "ten"
        case 2:
            return "hun\u{00AD}dred"
        case 3:
           return "thou\u{00AD}sand"
        case 4:
           return "ten\u{00AD}thou\u{00AD}sand"
        case 5:
           return "hun\u{00AD}dred\u{00AD}thou\u{00AD}sand"
        default:
            break
        }
        
        let illion = prefix(illion: nth/3)
        switch nth % 3 {
        case 0:
            return illion
        case 1:
            return "ten" + " " + illion
        case 2:
            return "hun\u{00AD}dred" + " " + illion
        default:
            return ""
        }
    }
	
	public func prefix(illion: Int) -> String {
		
        if illion == 0 { return "" }
		if illion >= 1000 {
			return "zillion"
		}
		if illion < bstr.count {
            let ans = illionAppender(bstr[illion])
            return ans
//			return bstr[illion] + illionstr
		}
		
		let h = illion / 100
		let d = (illion % 100) / 10
		let e = (illion - h * 100 - d * 10) % 10
		
		let hh = hstr[h]
		let dd = dstr[d]
		var ee = estr[e]
		
		switch e {
		case 3:
			switch d {
			case 2,3,4,5:
				ee = ee + "s"
			default: break
			}
		case 6:
			switch d {
			case 0:
				switch h {
				case 1,8:
					ee = ee + "x"
				case 3,4,5:
					ee = ee + "s"
				default:
					break
				}
			case 2,3,4,5:
				ee = ee + "s"
			case 8:
				ee = ee + "x"
			default:
				break
			}
		case 7,9:
			switch d {
			case 0:
				switch h {
				case 1,2,3,4,5,6,7:
					ee = ee + "n"
				case 8:
					ee = ee + "m"
				default:
					break
				}
			case 1,3,4,5,6,7:
				ee = ee + "n"
			case 2,8:
				ee = ee + "m"
			default:
				break
			}
		default:
			break
		}
		
		//to be continued with
		//https://mrob.com/pub/math/ln-notes1-2.html#cw_table
		return illionAppender(ee + dd + hh)
	}
}

public class SpokenNumberGerman {
	public static let shared = SpokenNumberGerman()
	private init() {}
	
	let small = ["null", "eins", "zwei", "drei", "vier", "fünf", "sechs", "sie\u{00AD}ben", "acht", "neun", "zehn", "elf", "zwölf", "drei\u{00AD}zehn", "vier\u{00AD}zehn", "fünf\u{00AD}zehn", "sech\u{00AD}zehn", "sieb\u{00AD}zehn","acht\u{00AD}zehn", "neun\u{00AD}zehn"]
	let smallprefix = ["", "ein", "zwei", "drei", "vier", "fünf", "sechs", "sie\u{00AD}ben", "acht", "neun"]
	let smallprefix2 = ["", "eine", "zwei", "drei", "vier", "fünf", "sechs", "sie\u{00AD}ben", "acht", "neun"]

	let tens = [ "", "zehn", "zwan\u{00AD}zig", "drei\u{00AD}ßig", "vier\u{00AD}zig", "fünf\u{00AD}zig", "sech\u{00AD}zig", "sieb\u{00AD}zig", "acht\u{00AD}zig", "neun\u{00AD}zig" ]
	let hundred = "hun\u{00AD}dert"
	let soft = "\u{00AD}"

	let bigger = ["mi\u{00AD}llion", "bi\u{00AD}llion" , "tri\u{00AD}llion", "qua\u{00AD}drillion", "quin\u{00AD}tilion","sex\u{00AD}tillion","sep\u{00AD}tillion","oct\u{00AD}illion","No\u{00AD}nillion"]
	let bigger3 = ["mi\u{00AD}lliard", "bi\u{00AD}lliard" , "tri\u{00AD}lliard", "qua\u{00AD}drilliard", "quin\u{00AD}tiliard","sex\u{00AD}tilliard","sep\u{00AD}tilliard","oct\u{00AD}illiard","No\u{00AD}nilliard"]
	let thousand = "tau\u{00AD}send"
	
	public func Spoken(n: BigUInt) -> String {
		var ans = spoken(n: n)
		ans.capitalizeFirstLetter()
		return ans
	}
	public func spoken(n: BigUInt) -> String {
		
		func capitalize(_ prefifx : String, _ unit: String) -> String {
			return prefifx.capitalizingFirstLetter() + " " + unit.capitalizingFirstLetter()
		}
		
		if n < 20 { return small[Int(n)] }
		if n < 100 {
			var str = tens[Int(n) / 10]
			switch Int(n) % 10 {
			case 0:
				break
			default:
				str = smallprefix[Int(n) % 10] + "und" + str
			}
			return str
		}
		if n < 1000 {
			var ans = smallprefix[Int(n)/100] + soft + hundred
			if n % 100 > 0 { ans += soft + spoken(n: n % 100) }
			return ans
		}
		if n < 1000000 {
			var ans = ""
			if n / 1000 >= 10 {
				ans = spoken(n: n / 1000) + soft
			} else if n / 1000 >= 1 {
				ans = smallprefix[Int(n/1000)] + soft
			}
			ans = ans + thousand
			if n % 1000 == 0 { return ans }
			ans = ans + soft + spoken(n: n % 1000)
			return ans
		}
		
        var (test,index,ans,_) = (BigUInt(1000000),0,"",BigUInt(0))
		repeat {
			if n>=test {
				let prefix = n / test
				if prefix < 1000 {
					if prefix < 10 {
						ans = smallprefix2[Int(prefix)] + soft
					} else {
						ans = spoken(n: prefix) + soft
					}
					ans =  capitalize(ans,bigger[index])
					if prefix > 1 { ans = ans + "en" } //Plural
					if n % test > 0 {
						ans = ans + " " + spoken(n: n % test).capitalizingFirstLetter()
					}
					return ans
				}
			}
			test = test * 1000
			if n>=test {
				let prefix = n / test
				if prefix < 1000 {
					if prefix < 10 {
						ans = smallprefix2[Int(prefix)] + soft
					} else {
						ans = spoken(n: prefix) + soft
					}
					ans =  capitalize(ans,bigger3[index])
					if prefix > 1 { ans = ans + "en" } else { ans = ans + "e" }//Plural
					if n % test > 0 {
						ans = ans + " " + spoken(n: n % test).capitalizingFirstLetter()
					}
					return ans
				}
		}
			test = test * 1000
			index = index + 1
		} while index < min(bigger.count,bigger3.count)
		return "Zillionen"
	}
}

public class SpokenNumberLatin {
    public static let shared = SpokenNumberLatin()
    private init() { }
    
    let small = ["nulla", "unum", "duo", "tribus", "quattuor", "quinque", "sex", "septem", "octo", "novem", "decem", "undecim", "duodecim", "tredecim", "quattordecim", "quindecim", "se\u{00AD}decim", "septemdecim","octōdecim", "novemdecim"]
    let small2 = ["nulla", "unus", "duo", "tres", "quattuor", "quinque", "sex", "septem", "octo", "novem", "decem", "undecim", "duodecim", "tredecim", "quattordecim", "quindecim", "se\u{00AD}decim", "septemdecim","octōdecim", "novemdecim"]

    let tens = [ "", "decem", "viginti", "triginta", "quadraginta", "quinquaginta", "sexaginta", "septuaginta", "octoginta", "nonaginta","centum"]
    let hundreds = ["","centum","ducenti","trecenti","quadrigenti","quingenti","sescenti","septingenti","octingenti","nongenti","mille"]
    
    let bigger = ["decies centena milia", "bi\u{00AD}llion" , "tri\u{00AD}llion", "qua\u{00AD}drillion", "quin\u{00AD}tilion","sex\u{00AD}tillion","sep\u{00AD}tillion","oct\u{00AD}illion","No\u{00AD}nillion"]
    let bigger3 = ["mi\u{00AD}lliard", "bi\u{00AD}lliard" , "tri\u{00AD}lliard", "qua\u{00AD}drilliard", "quin\u{00AD}tiliard","sex\u{00AD}tilliard","sep\u{00AD}tilliard","oct\u{00AD}illiard","No\u{00AD}nilliard"]

    let thousand = "mille"
    let thousands = "millia"
    
    let soft = "\u{00AD}"
    
    public func spoken(n: BigUInt) -> String {
        var (_,_,ans) = (self,Int(n % 10),"")
        if n < 20 { return small[Int(n)] }
        if n < 100 {
            let r10 = Int(n % 10)
            let d10 = Int(n / 10)
            switch r10
            {
            case 0:
                return tens[d10]
            case 8:
                if n != 98 {
                    return "duo de " + tens[d10+1]
                } else {
                    return "nōnāgintā octō"
                }
            case 9:
                if n == 99 {
                    return "nōnāgintā novem"
                }
                return "un de " + tens[d10+1]
            default:
                return tens[d10] + " " + small2[r10]
            }
        }
        if n < 1000 {
            let r100 = Int(n % 100)
            let d100 = Int(n / 100)
            
            var ans = hundreds[d100]
            if r100 > 0 {
                ans = ans + " " + spoken(n: n % 100)
            }
            return ans
        }
        
        if n < 1000000 {
            if n / 1000 > 1 {
                ans = spoken(n: n / 1000) + " " + thousands
            } else {
                ans = thousand
            }
            if n % 1000 > 0 {
                ans = ans + " " + spoken(n: (n%1000))
            }
            return ans
        }
        
        
        var (test,index,_) = (BigUInt(1000000),0,BigUInt(0))
        
        repeat {
            if n>=test {
                let prefix = n / test
                if prefix < 1000 {
                    ans = spoken(n: prefix) + " " + bigger[index]
                    if prefix > 1 { ans = ans + "e" }
                    if n % test > 0 {
                        ans = ans + " " + spoken(n: n % test)
                    }
                    return ans
                }
            }
            test = test * 1000
            if n>=test {
                let prefix = n / test
                if prefix < 1000 {
                    ans = spoken(n: prefix) + " " + bigger3[index]
                    if prefix > 1 { ans = ans + "er" }
                    if n % test > 0 {
                        ans = ans + " " + spoken(n: n % test)
                    }
                    return ans
                }
            }
            test = test * 1000
            index = index + 1
        } while index < min(bigger.count,bigger3.count)
        return "myriades"
    }
    
    public func Explain(n: BigUInt) -> String {
        var (digit,ans) = (Int(n % 10),"")
        if n <= 10 { return String(n % 20)}
        if n < 20 { return  String(digit) + "+10" }
        
        let tensexplain = [ "", "10", "2*10", "3*10", "4*10", "5*10","6*10","7*10","8*10","9*10"]
        
        if n < 100 {
            if n % 10 > 0 { ans = String(digit) + soft + "+" + soft }
            ans = ans + soft + tensexplain[Int(n / 10)]
            return ans
        }
        if n < 1000 {
            ans = String(Int(n/100)) + "*" + "100"
            if n % 100 > 0 { ans = ans + "+" + Explain(n: (n % 100)) }
            return ans
        }
        if n < 1000000 {
            var temp = Explain(n: (n / 1000))
            if temp.contains("+") {
                temp = "(" + temp + ")"
            }
            ans = temp + "*" + "10^3"
            if n % 1000 > 0 {
                ans = ans + "+" + Explain(n: (n%1000))
            }
            return ans
        }
        
        
        var (test,index,_) = (BigUInt(1000000),0,BigUInt(0))
        
        repeat {
            if n>=test {
                let prefix = n / test
                if prefix < 1000 {
                    var prefixstr = prefix > 1 ? Explain(n: prefix) : ""
                    if prefixstr.contains("+") { prefixstr = "(" + prefixstr + ")" }
                    if prefixstr.count>0 { prefixstr = prefixstr + "*" }
                    var expstr = index==0 ? "6" : String(index+1) + "*6"
                    expstr = expstr.superscript()
                    ans = prefixstr + "10" + expstr
                    //if prefix > 1 { ans = ans + "er" }
                    if n % test > 0 {
                        ans = ans + "+" + Explain(n: n % test)
                    }
                    return ans
                }
            }
            test = test * 1000
            if n>=test {
                let prefix = n / test
                if prefix < 1000 {
                    var prefixstr = prefix > 1 ? Explain(n: prefix) : ""
                    if prefixstr.contains("+") { prefixstr = "(" + prefixstr + ")" }
                    if prefixstr.count>0 { prefixstr = prefixstr + "*" }
                    var expstr = index==0 ? "6+3" : String(index+1) + "*6+3"
                    expstr = expstr.superscript()
                    ans = prefixstr + "10" + expstr
                    //if prefix > 1 { ans = ans + "er" }
                    if n % test > 0 {
                        ans = ans + "+" + Explain(n: n % test)
                    }
                    return ans
                }
            }
            test = test * 1000
            index = index + 1
        } while index < min(bigger.count,bigger3.count)
        return "\u{221}"
    }
    



}

public class SpokenNumberDanish {
	public static let shared = SpokenNumberDanish()
	private init() { }
	
	let small = ["nul", "en", "to", "tre", "fire", "fem", "seks", "syv", "otte", "ni", "ti", "elleve", "tolv", "tretten", "fjor\u{00AD}ten", "fem\u{00AD}ten", "seks\u{00AD}ten", "syt\u{00AD}ten","at\u{00AD}ten", "nit\u{00AD}ten"]
	let tens = [ "", "", "tyve", "tredive", "fyrre", "halv\u{00AD}treds", "tres", "halv\u{00AD}fjerds", "firs", "halv\u{00AD}fems"]
	
	let bigger = ["mi\u{00AD}llion", "bi\u{00AD}llion" , "tri\u{00AD}llion", "qua\u{00AD}drillion", "quin\u{00AD}tilion","sex\u{00AD}tillion","sep\u{00AD}tillion","oct\u{00AD}illion","No\u{00AD}nillion"]
	let bigger3 = ["mi\u{00AD}lliard", "bi\u{00AD}lliard" , "tri\u{00AD}lliard", "qua\u{00AD}drilliard", "quin\u{00AD}tiliard","sex\u{00AD}tilliard","sep\u{00AD}tilliard","oct\u{00AD}illiard","No\u{00AD}nilliard"]
	let hundred = "hundrede"
	let thousand = "tusind"
	let thousand1 = "tusinde"
	
	let soft = "\u{00AD}"
	
	
	
	public func spoken(n: BigUInt) -> String {
        var (_,digit,ans) = (self,Int(n % 10),"")
		if n < 20 { return small[Int(n)] }
		if n < 100 {
			if n % 10 > 0 { ans = small[digit] + soft + "og" + soft }
			ans = ans + soft + tens[Int(n / 10)] 
			return ans
		}
		if n < 1000 {
			ans = small[Int(n/100)] + " " + hundred
			if n % 100 > 0 { ans = ans + " " + spoken(n: (n % 100)) }
			return ans
		}
		if n < 1000000 {
			ans = spoken(n: n / 1000) + " " + thousand
			if n % 1000 > 0 {
				ans = ans + " " + spoken(n: (n%1000))
			}
			return ans
		}
	
	
        var (test,index,_) = (BigUInt(1000000),0,BigUInt(0))
		
		repeat {
			if n>=test {
				let prefix = n / test
				if prefix < 1000 {
					ans = spoken(n: prefix) + " " + bigger[index]
					if prefix > 1 { ans = ans + "er" }
					if n % test > 0 {
						ans = ans + " " + spoken(n: n % test)
					}
					return ans
				}
			}
			test = test * 1000
			if n>=test {
				let prefix = n / test
				if prefix < 1000 {
					ans = spoken(n: prefix) + " " + bigger3[index]
					if prefix > 1 { ans = ans + "er" }
					if n % test > 0 {
						ans = ans + " " + spoken(n: n % test)
					}
					return ans
				}
			}
			test = test * 1000
			index = index + 1
		} while index < min(bigger.count,bigger3.count)
		return "myriades"
	}
	
	public func Explain(n: BigUInt) -> String {
		var (digit,ans) = (Int(n % 10),"")
		if n <= 12 { return String(n % 20)}
		if n < 20 { return  String(digit) + "+10" }
		
		let tensexplain = [ "", "10", "20", "3*10", "4*10", "(3-½)*20", "3*20", "(4-½)*20", "4*20", "(5-½)*20"]

		if n < 100 {
			if n % 10 > 0 { ans = String(digit) + soft + "+" + soft }
			ans = ans + soft + tensexplain[Int(n / 10)]
			return ans
		}
		if n < 1000 {
			ans = String(Int(n/100)) + "*" + "100"
			if n % 100 > 0 { ans = ans + "+" + Explain(n: (n % 100)) }
			return ans
		}
		if n < 1000000 {
			var temp = Explain(n: (n / 1000))
			if temp.contains("+") {
				temp = "(" + temp + ")"
			}
			ans = temp + "*" + "10^3"
			if n % 1000 > 0 {
					ans = ans + "+" + Explain(n: (n%1000))
			}
			return ans
		}
		
		
        var (test,index,_) = (BigUInt(1000000),0,BigUInt(0))
		
		repeat {
			if n>=test {
				let prefix = n / test
				if prefix < 1000 {
					var prefixstr = prefix > 1 ? Explain(n: prefix) : ""
					if prefixstr.contains("+") { prefixstr = "(" + prefixstr + ")" }
					if prefixstr.count>0 { prefixstr = prefixstr + "*" }
					var expstr = index==0 ? "6" : String(index+1) + "*6"
					expstr = expstr.superscript()
					ans = prefixstr + "10" + expstr
				//if prefix > 1 { ans = ans + "er" }
					if n % test > 0 {
						ans = ans + "+" + Explain(n: n % test)
					}
					return ans
				}
			}
			test = test * 1000
			if n>=test {
				let prefix = n / test
				if prefix < 1000 {
					var prefixstr = prefix > 1 ? Explain(n: prefix) : ""
					if prefixstr.contains("+") { prefixstr = "(" + prefixstr + ")" }
					if prefixstr.count>0 { prefixstr = prefixstr + "*" }
					var expstr = index==0 ? "6+3" : String(index+1) + "*6+3"
					expstr = expstr.superscript()
					ans = prefixstr + "10" + expstr
					//if prefix > 1 { ans = ans + "er" }
					if n % test > 0 {
						ans = ans + "+" + Explain(n: n % test)
					}
					return ans
				}
			}
			test = test * 1000
			index = index + 1
		} while index < min(bigger.count,bigger3.count)
		return "\u{221}"
	}
    
    
}

public class SpokenNumberDozenal {
        public static let shared = SpokenNumberDozenal()
        private init() { }
    
    
    let small = ["ze\u{200B}ro", "one", "two", "three", "four", "five", "six", "se\u{200B}ven", "eight", "nine", "dek", "el"]
    
    let bigger = ["", "do", "gro", "mo","tri-mo","quadri-mo","quinti-mo","sexti-mo","septi-mo","octi-mo","noni-mo","deki-mo"]
    let soft = "\u{00AD}"

    
    public func spoken(n: BigUInt) -> String {
        if n < 12 { return small[Int(n)] }
        
        var ans = ""
        var rest = n
        for power in 0..<bigger.count {
            let digit = Int(rest % 12)
            if digit > 0 {
                var next = small[digit]
                if power > 0 {
                    next = next + " " + bigger[power] + " "
                }
                ans = next + ans
            }
            rest = rest / 12
            if rest == 0 {
                return ans
            }
        }
        return "\u{221}"
        
    }

}

public class SpokenNumberTonga {
        public static let shared = SpokenNumberTonga()
        private init() { }
    
    
    let small = ["noa", "taha", "ua", "tolu", "fa", "nima", "ono", "fitu", "valu", "hiva"]

    public func spoken(n: BigUInt) -> String {
        
        var ans = ""
        var rest = n
        if rest == 0 { return "noa" }
        
        for _ in 0...10 {
            let digit = Int(rest % 10)
            ans = small[digit] + " " + ans
            rest = rest / 10
            if rest == 0 {
                return ans
            }
        }
        return "uô"
    }

}

public class SpokenNumberKlingon {
        public static let shared = SpokenNumberKlingon()
        private init() { }
    
    
    let small = ["pagh","wa’", "cha’", "wej", "loS", "vagh", "jav", "Soch", "chorgh", "Hut"]
    let powers = ["","maH","vatlh","SaD","netlh","bIp","’uy’"]
    
    
    public func spoken(n: BigUInt) -> String {
    
        if n < 10 {
            return small[Int(n)]
        }
        
        var ans = ""
        
        var rest = n
        for power in 0..<powers.count {
            let digit = Int(rest % 10)
            if digit > 0 {
                ans = small[digit] + powers[power] + " " + ans
            }
            rest = rest / 10
            if rest == 0 {
                return ans
            }
        }
        return "law'"
    }

}





