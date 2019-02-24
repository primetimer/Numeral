//
//  KeilSchrift.swift
//  Numbers
//
//  Created by Stephan Jancar on 17.02.18.
//  Copyright © 2018 Stephan Jancar. All rights reserved.
//

import Foundation
import BigInt

public extension BigUInt {
    func scientific() -> String {
        //let dot = "\u{22C5}"
        let s = String(self)
        guard let d = Double(s) else { return "\u{221E}" }
        //if d.isZero { return "0" }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.positiveFormat = "0.000E0"
        formatter.exponentSymbol = "e"
        let number = NSNumber(value: d)
        let ans = formatter.string(from :number) ?? description
        
        let d2 = Double(ans)
        if d2 != d {
            return "\u{2248}" + ans
        }
        return ans
    }
}


public extension BigUInt {
	func Duodezimal() -> String {	
		//let superscript = '⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ⁺ ⁻ ⁼ ⁽ ⁾ ₀ ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₊ ₋ ₌ ₍ ₎ ᵃ ᵇ ᶜ ᵈ ᵉ ᶠ ᵍ ʰ ⁱ ʲ ᵏ ˡ ᵐ ⁿ ᵒ ᵖ ʳ ˢ ᵗ ᵘ ᵛ ʷ ˣ ʸ ᶻ ᴬ ᴮ ᴰ ᴱ ᴳ ᴴ ᴵ ᴶ ᴷ ᴸ ᴹ ᴺ ᴼ ᴾ ᴿ ᵀ ᵁ ⱽ ᵂ ₐ ₑ ₕ ᵢ ⱼ ₖ ₗ ₘ ₙ ₒ ₚ ᵣ ₛ ₜ ᵤ ᵥ ₓ ᵅ ᵝ ᵞ ᵟ ᵋ ᶿ ᶥ ᶲ ᵠ ᵡ ᵦ ᵧ ᵨ ᵩ ᵪ'
		
		var ans = ""
		var stellen = self
		if self == 0 { return "0" }
		while stellen > 0 {
			let digit = Int(stellen % 12)
			ans = Digit12(digit: digit) + ans
			stellen = stellen / 12
		}
		if ans.count > 1 {
			ans = ans + "ᵈᶻ" //"\u{01F3}"  // "₁₂"
		}
		return ans
	}
	
	private func Digit12(digit: Int) -> String {
		let mathdigits = [ "\u{1D7E2}","\u{1D7E3}","\u{1D7E4}","\u{1D7E5}","\u{1D7E6}","\u{1D7E7}","\u{1D7E8}","\u{1D7E9}","\u{1D7EA}","\u{1D7EB}","ᘔ", "Ɛ"]
		return mathdigits[digit]
	}
}

public extension BigUInt {
	
	func IndianArabian() -> String {
		let arabian = ["\u{0660}","\u{0661}","\u{0662}","\u{0663}","\u{0664}","\u{0665}","\u{0666}","\u{0667}","\u{0668}","\u{0669}"]
		if self == 0 { return arabian[0] }
		var ans = ""
		var stellen = self
		while stellen > 0 {
			let digit = Int(stellen % 10)
			ans = arabian[digit] + ans
			stellen = stellen / 10
		}
		return ans
	}
}

public extension BigUInt {
	
	private func GreekUpto10000() ->String {
		let greek = ["α","β","γ","δ","ε","ϛ","ζ","η","θ","ι","κ","λ","μ","ν","ξ","ο","π","ϟ","ρ","σ","τ","υ","φ","χ","ψ","ω","ϡ","͵α", "͵β","͵γ","͵δ","͵ε","͵ϛ","͵ζ","͵η","͵θ"]
		// Maybe use "ϙ" instead of "ϟ"		
		var index = 0
		var stellen = self
		var ans = ""
		while stellen > 0 {
			let digit = Int(stellen % 10)
			if digit > 0 {
				let g = (digit + index - 1) % greek.count
				ans = greek[g] + ans
			}
			stellen = stellen / 10
			index = index + 9
		}
		return ans
		
	}
	
	func Greek() -> String {
		var ans = ""
		var stellen = self
		var powindex = 0
		
		while stellen>0 {
			let mod10000 = stellen % 10000
			if mod10000 > 0 {
				
				if powindex > 0 {
					ans = mod10000.GreekUpto10000() + " " + ans
					let mpowgreek = BigUInt(powindex).Greek() + "M"
					ans = mpowgreek + ans
				} else {
					ans = mod10000.GreekUpto10000()
				}
			}
			powindex = powindex + 1
			stellen = stellen / 10000
		}
		return ans
	}
	
	func Hebraian() -> String {
		let aleph = "א"
		
		let thousand = "׳"
		let hebraian = [aleph,"ב","\u{05D2}","\u{05D3}","\u{05D4}","\u{05D5}","\u{05D6}","\u{05D7}","\u{05D8}","\u{05D9}",
						/* "\u{05DA}" Kaph end not used */
			"\u{05DB}","\u{05DC}",
			/* "\u{05DD}" */
			"\u{05DE}",
			/* "\u{05DF}" */
			"\u{05E0}","\u{05E1}",
			"\u{05E2}",
			/* "\u{05E3}" */
			"\u{05E4}", /* "\u{05E5}", */
			"\u{05E6}","\u{05E7}","\u{05E8}",
			"\u{05E9}","\u{05EA}",
			"\u{05DA}",
			"\u{05DD}",
			"\u{05DF}",
			"\u{05E3}",
			"\u{05E5}"]
		var ans = ""
		var stellen = self
		var index = 0
		while stellen > 0 {
			let digit = Int(stellen % 10)
			
			//Special case 15 and 16
			if stellen % 100 == 15 && index == 0 {
				ans = hebraian[9-1] + hebraian[5] + ans
				stellen = stellen / 100
				index = 18
				continue
			} else if stellen % 100 == 16 && index == 0 {
				ans = hebraian[9-1] + hebraian[6]
				stellen = stellen / 100
				index = 18
				continue
			} else if digit > 0 {
				let g = (digit + index - 1) % hebraian.count
				ans = hebraian[g] + ans
			}
			
			stellen = stellen / 10
			index = index + 9
			if index >= hebraian.count && stellen > 0 {
				index = 0
				ans = thousand + ans
			}
		}
		return ans
		
	}
	
	private func AbjadUpto999() ->String {
		//https://en.wikipedia.org/wiki/Abjad_numerals
		let onetonine = ["\u{0627}","\u{0628}","\u{062C}","\u{062F}","\u{0647}","\u{0648}","\u{0632}","\u{062D}","\u{0637}"]
		let tens = ["\u{0649}","\u{0643}","\u{0644}","\u{0645}","\u{0646}","\u{0633}","\u{0639}","\u{0641}","\u{0635}"]
		let hundreds = ["\u{0642}","\u{0631}","\u{0634}","\u{062A}","\u{062B}","\u{062E}","\u{0630}","\u{0636}","\u{0638}"]
		//let thousand = "\u{063A}"
		var (stellen,digit,ans) = (self,Int(self % 10),"")
		if self == 0 { return "" }
		
		if digit > 0 { ans = onetonine[digit-1] }
		stellen = stellen / 10
		digit = Int(stellen % 10)
		if digit > 0 { ans = ans + tens[digit-1] }
		stellen = stellen / 10
		digit = Int(stellen % 10)
		if digit > 0 { ans = ans + hundreds[digit-1] }
		
		return ans
	}
	
	/* Not in ios fonts : Use symbola */
	func Rod() -> String {
		let digits = [
			["\u{3007}","𝍠","𝍡","𝍢","𝍣","𝍤","𝍥","𝍦","𝍧","𝍨"],
		  	["\u{3007}","𝍩","𝍪","𝍫","𝍬","𝍭","𝍮","𝍯","𝍰","𝍱"]
		]
		
		//???\u{1D360}","\u{1D361}","\u{1D362}","\u{1D363}","\u{1D364}","\u{1D365}","\u{1D366}","\u{1D367}","\u{1D368}","\u{1D369}"]
		if self == 0 { return digits[0][0] }
		var stellen = self
		var ans = ""
		var index = 0
		while stellen > 0 {
			let digit = Int(stellen % 10)
			ans = digits[index][digit] + ans
			stellen = stellen / 10
			index = 1 - index
		}
		return ans
	}
	
	func Abjad() -> String {
		var powindex = 0
		var stellen = self
		var ans = ""
		while stellen > 0 {
			let mod1000 = stellen % 1000
			var tpow = ""
			if powindex > 0 {
				for _ in 0..<powindex {
					let thousand = "\u{063A}"
					tpow = tpow + thousand
				}
			}
			if mod1000 == 1 && stellen < 1000 && powindex > 0 {
				ans = ans + tpow
			} else if mod1000 > 0 {
				ans = ans + tpow + mod1000.AbjadUpto999() //+ tpow + ans
			}
			stellen = stellen / 1000
			powindex = powindex + 1
		}
		return String(ans.reversed())
	}
	
	private func PhonicianUpto9() ->String {
		//https://en.wikipedia.org/wiki/Phoenician_alphabet#Numerals
		let one = "\u{10916}"
		let two = "\u{1091A}"
		let three = "\u{1091B}"
		
		if self == 0 { return "" }
		if self == 1 { return one }
		if self == 2 { return two }
		return three + (self-3).PhonicianUpto9()
	}
	
	private func PhonicianUpto9999(hundredsign : String, withprefix : Bool = false) -> String {
		let ten = "\u{10917}"
		let twenty = "\u{10918}"
		
		if self >= 100 && self < 200 && withprefix == false {
			let mod100 = self % 100
			return hundredsign + mod100.PhonicianUpto9999(hundredsign: "")
		}
		if self >= 100 {
				let div100 = self / 100
				let mod100 = self % 100
				return div100.PhonicianUpto9999(hundredsign: "") + hundredsign + mod100.PhonicianUpto9999(hundredsign : "")
		}
		if self < 100 {
			let mod10 = self % 10
			let ans = mod10.PhonicianUpto9()
			
			let div10 = self / 10
			switch Int(div10) {
			case 1:
				return ten + ans
			case 2:
				return twenty + ans
			case 3:
				return twenty + ten + ans
			case 4:
				return twenty + twenty + ans
			case 5:
				return twenty + twenty + ten + ans
			case 6:
				return twenty + twenty + twenty + ans
			case 7:
				return twenty + twenty + twenty + ten + ans
			case 8:
				return twenty + twenty + twenty + twenty + ans
			case 9:
				return twenty + twenty + twenty + twenty + ten + ans
			default:
				return ans
			}
		}
		return ""
	}
	
	func Phonician() -> String {
		
		let hundred = "\u{10919}"
		var powstr = hundred
		
		let mod10000 = self % 10000
		var prefix = (self > 10000)
		var ans = mod10000.PhonicianUpto9999(hundredsign: hundred,withprefix: prefix)
		
		var stellen = self / 10000
		while stellen>0 {
			prefix = (stellen >= 100)
			powstr = powstr + hundred
			let mod100 = stellen % 100
			if mod100 == 1 && prefix == false {
				ans = powstr + ans
			} else if mod100 > 0 {
				ans = mod100.PhonicianUpto9999(hundredsign: hundred,withprefix: prefix) + powstr + ans
			}
			stellen = stellen / 100
		}
		return String(ans.reversed())
		
	}
	
	func Egyptian() -> String {
		let zero = "𓄤" // "𓂜"
		let ones = ["𓐄","𓐅","𓐆","𓐇","𓐈","𓐉","𓐊","𓐋","𓐌"]
		let tens = ["𓎆","𓎇","𓎈","𓎉","𓎊","𓎋","𓎌","𓎍","𓎎"]
		let hundreds = ["𓍢","𓍣","𓍤","𓍥","𓍦","𓍧","𓍨","𓍩","𓍪"]
		let thousands = ["𓆼","𓆽","𓆾","𓆿","𓇀","𓇁","𓇂","𓇃","𓇄"]
		let tenthousands = ["𓂭","𓂮","𓂯","𓂰","𓂱","𓂲","𓂳","𓂴","𓂵"]
		let hundredthousands = ["𓆐","𓆐𓆐","𓆐𓆐𓆐","𓆐𓆐𓆐𓆐","𓆐𓆐𓆐𓆐𓆐","𓆐𓆐𓆐𓆐𓆐𓆐","𓆐𓆐𓆐𓆐𓆐𓆐𓆐","𓆐𓆐𓆐𓆐𓆐𓆐𓆐𓆐","𓆐𓆐𓆐𓆐𓆐𓆐𓆐𓆐𓆐"]
		let million = "𓁨"
		
		let powers = [ones,tens,hundreds,thousands,tenthousands,hundredthousands]
		if self == 0 {
			return zero
		}
		if self >= 1000000 {
			return million
		}
		var ans = ""
		var stellen = self
		var powindex = 0
		while stellen > 0
		{
			let digit = Int(stellen % 10)
			if digit > 0 {
				ans = powers[powindex][digit-1] + ans
			}
			powindex = powindex + 1
			stellen = stellen / 10
		}
		return ans
	}
	
	func Vigesimal() -> String {
		let symbols = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T"]
		var stellen = self
		var ans = ""
		if self == 0 { return symbols[0] }
		while stellen > 0 {
			let digit = Int(stellen % 20)
			ans = symbols[digit] + ans
			stellen = stellen / 20
		}
		return ans
	}
	
	func ChineseOmmitted() -> String {
		let chinese = ["〇","一","二","三","四","五","六","七","八","九"]
		var ans = ""
		if self == 0 {
			return "零"
		}
		var stellen = self
		while stellen > 0 {
			let digit = Int(stellen % 10)
			ans = chinese[digit] + ans
			stellen = stellen / 10
		}
		return ans		
	}
	
	func ChineseFinancial() -> String {
		let chinese = ["零","壹","貳","叄","肆","伍","陸","柒","捌","玖"]
		if self == 0 {
			return chinese[0]
		}
		var ans = ""
		var stellen = self
		while stellen > 0 {
			let digit = Int(stellen % 10)
			ans = chinese[digit] + ans
			stellen = stellen / 10
		}
		return ans
	}
	
	func Chinese() -> String {
		let chinese = ["零","一","二","三","四","五","六","七","八","九"]
		//let chinesef = ["零","壹","貳","叄","肆","伍","陸","柒","捌","玖"]

		let powers = ["","十","百","千"] //,"十万","百万","千万","亿"]
		let powers4 = ["", "万","亿","兆","京","垓","秭","穰","沟","涧","正","载"]
		
		if self < 10 {
			return chinese[Int(self)]
		}
		if self == 10 {
			return powers[1]
		}
		if self < 20 {
			let mod10 = Int(self % 10)
			return powers[1] + chinese[mod10]
		}
		
		/*
		if self >= onehundredmillion * onehundredmillion {
		return ChineseOmmitted()
		}
		*/
		
		var powindex4 = 0
		var ans = ""
		var stellen = self
		var powindex = 0
		var started = false
		var islastzero = false
		while stellen > 0 {
			let digit = Int(stellen % 10)
			if digit > 0 {
				ans = chinese[digit] + powers[powindex % 4] + ans
				started = true
				islastzero = false
			} else {
				if started && islastzero == false {
					ans = chinese[0] + ans
					islastzero = true
				}
			}
			stellen = stellen / 10
			powindex = powindex + 1
			if powindex == 4 {
				powindex4 = powindex4 + 1
				powindex = 0
				if stellen % 10000 > 0 {
					if powindex4 >= powers4.count {
						return ChineseOmmitted()
					}
					ans = powers4[powindex4] + ans
				}
			}
		}
		return ans
	}
}

public extension BigUInt {
	
	func RomanArchaicUpto10000() -> String {
		let ones = ["","Ⅰ","Ⅱ", "Ⅲ","Ⅳ","Ⅴ","Ⅵ","Ⅶ","Ⅷ","Ⅸ","Ⅹ","Ⅺ","Ⅻ"]
		if self <= 12 { return ones[Int(self)] }
		let tens = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC","C"]
		let hundreds = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","Cↀ","ↀ"]
		let thousands = ["","ↀ","ↀↀ","ↀↀↀ","ↀↁ","ↁ","ↁↀ","ↁↀↀ","ↁↀↀↀ","ↀↂ","ↂ"]
//		let tenthousands = ["","ↂ","CⅡↃ","CⅢↃ","CⅣↃ","CⅤↃ","CⅥↃ","CⅦↃ","CⅧↃ","CⅨↃ"]
		let tenthousands = ["","ↂ","ↂↂ","ↂↂↂ","ↂↇ","ↇ","ↇↂ","ↇↂↂ","ↇↂↂↂ","ↂↈ","ↈ"]
		if self < 12 { return ones[Int(self)] }
		
		let y = Int(self) / 10000
		let m = (Int(self) % 10000) / 1000
		let h = (Int(self) % 1000) / 100
		let t = (Int(self) % 100) / 10
		let o = Int(self) % 10
		return tenthousands[y] + thousands[m] + hundreds[h] + tens[t] + ones[o]
	}
	
	func RomanAnsiUpTo5000() -> String {
		let onesansi = ["","Ⅰ","II", "III","IV","V","VI","VII","VIII","IX","X","XI","XII"]
		let tens = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC","C"]
		let hundreds = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM","M"]
		if self <= 1000 {
			let h = Int(self) / 100
			let t = (Int(self) % 100) / 10
			let o = Int(self) % 10
			return hundreds[h] + tens[t] + onesansi[o]
		}
		
		var temp = self
		var ans = ""
		while temp >= 1000 {
			ans = ans + "M"
			temp = temp - 1000
		}
		ans = ans + temp.RomanAnsiUpTo5000()
		return ans
	}
	
	func Roman() -> String {
		let ones = ["","Ⅰ","Ⅱ", "Ⅲ","Ⅳ","Ⅴ","Ⅵ","Ⅶ","Ⅷ","Ⅸ","Ⅹ","Ⅺ","Ⅻ"]

		if self <= 12 { return ones[Int(self)] }
		let tens = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC","C"]
		let hundreds = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM","M"]
		if self <= 1000 {
			let h = Int(self) / 100
			let t = (Int(self) % 100) / 10
			let o = Int(self) % 10
			return hundreds[h] + tens[t] + ones[o]
		}
		if self < 10000 {
			return RomanArchaicUpto10000()
		}
		if self < 1000000 {
			let low = (self % 1000).Roman()
			let high = (self / 1000).RomanAnsiUpTo5000()
			var ans = ""
			for c in high { ans = ans + String(c) + "\u{0305}"  }
			return ans + low
		}
		if self < 1000000*1000 {
			let low = (self % 1000000).Roman()
			let high = (self / 1000000).RomanAnsiUpTo5000()
			var ans = ""
			for c in high { ans = ans + String(c) + "\u{033F}" }
			return ans + low
		}
		if self <= BigUInt(1000000)*1000*10 {
			let low = (self % 100000).RomanArchaicUpto10000()
			let high = (self / 100000).RomanArchaicUpto10000()
			var ans = ""
			for c in high { ans = ans + String(c) + "\u{20DE}" }
			return ans + low
		}
		do {
			var stellen = self
			var ans = ""
			var pot5 = 0
			while stellen > 0 {
				let low = (stellen % 100000)
				let lowstr = low.RomanArchaicUpto10000()
				stellen = stellen / 100000
				pot5 += 1
				if lowstr.count == 0 { continue }
				
				var potstr = ""
				for _ in 1..<pot5 {	potstr = potstr + "|" }
				ans = potstr + lowstr + potstr + ans
			}
			return ans
		}
		
		return "ↈ"
	}
}

public extension BigUInt  {
	
	func GlagoliticUpto1000(small : Bool = false) -> String {
		let k = ["","Ⰰ","Ⰱ","Ⰲ","Ⰳ","Ⰴ","Ⰵ","Ⰶ","Ⰷ","Ⰸ"]
		let k10 = ["","Ⰺ","Ⰻ","Ⰼ","Ⰼ","Ⰾ","Ⰿ","Ⱀ","Ⱁ","Ⱂ"]
		let k100 = ["","Ⱃ","Ⱄ","Ⱅ","Ⱆ","Ⱇ","Ⱈ","Ⱉ","Ⱋ","Ⱌ"]
		
		if self == 0 { return "" }
		let d0 = Int(self % 10)
		let d1 = Int((self / 10) % 10)
		let d2 = Int((self / 100) % 10)
		
		let s = small ? k100[d2] + k[d0] + k10[d1] : k100[d2] + k10[d1] + k[d0]
		return s
	}
	func Glagolitic() -> String {
		//Pure fantasy
		var (stellen,ans) = (self,"")
		while stellen > 0 {
			ans = (stellen%1000).GlagoliticUpto1000() + ans
			stellen = stellen / 1000
			if stellen > 0 { ans = "Ⱍ" + ans }
		}
		return ans
	}
	func KyrillicUpto1000(small : Bool = false) -> String {
		let k = ["","А","В","Г","Д","Е","Ѕ","З","И","Ѳ"]
		let k10 = ["","І","К","Л","М","Н","Ѯ","О","П","Ч"]
		let k100 = ["","Р","С","Т","У","Ф","Х","Ѱ","Ѡ","Ц"]
		
		if self == 0 { return "" }
		let d0 = Int(self % 10)
		let d1 = Int((self / 10) % 10)
		let d2 = Int((self / 100) % 10)
		
		let s = small ? k100[d2] + k[d0] + k10[d1] : k100[d2] + k10[d1] + k[d0]
		return s
	}
	
	func Kyrillic(small : Bool = true) -> String {

		func fixit(_ str : String, prefix: String = "" , postfix: String = "", onetime: Bool = false) -> String {
			var ans = ""
			if onetime {
				return prefix + str + postfix
			}
			for c in str {
				if String(c) == "҂" {
					ans = ans + String(c)
				} else {
					ans = ans + prefix + String(c) + postfix
				}
			}
			return ans
		}
		
		var (pot,root) = (BigUInt(1000),BigUInt(1))
		if self < pot {
			return self.KyrillicUpto1000(small : small)
		}
		(pot,root) = (pot * pot,pot)
		if self < pot {
			let low = (self % root).Kyrillic(small : false)
			let high = (self / root).Kyrillic(small : false)
			let ans = fixit(high,prefix: "҂") + low
			return ans
		}
		(pot,root) = (pot * pot,pot)
		if self < pot {
			let low = (self%root).Kyrillic(small : false)
			let high = (self/root).Kyrillic(small : false)
			let ans = fixit(high,postfix: "\u{20dd}") + low
			return ans
		}
		for postfix in ["\u{0488}","\u{0489}","\u{a670}","\u{a671}","\u{a672}","\u{a672}\u{a672}"] {
			(pot,root) = (pot * pot,pot)
			if self < pot {
				let low = (self%root).Kyrillic(small : false)
				let high = (self/root).Kyrillic(small : false)
				let ans = fixit(high,postfix: postfix,onetime: true) + low
				return ans
			}
		}
		return ""
		
		/*
		var temp = self / 1000
		ans = (temp%1000).Kyrillic(prefix: "҂") + ans
		
		temp = temp / 1000000
		ans = (temp % 1000000).Kyrillic(suffix: "\u{20dd}") + ans
		
		temp = temp / 1000000 / 1000000
		ans = (temp % (1000000 * 1000000)).Kyrillic(suffix: " ҈") + ans

		temp = temp / 10
		ans = (temp % 10).Kyrillic(suffix: " ҉") + ans

		temp = temp / 10
		ans = (temp % 10).Kyrillic(suffix: "\u{a670}") + ans

		temp = temp / 10
		ans = (temp % 10).Kyrillic(suffix: "\u{a671}") + ans
		
		temp = temp / 10
		ans = (temp % 10).Kyrillic(suffix: "\u{a672}") + ans

		return ans
		*/
		
//
//
//		if self <
//		let powers = "҂ ⃝ ҈ ꙰ ꙱"
//		let t = "9\u{20dd}a M\u{20de}23  1\u{0305}23" //c ⃝"
//		return t
//		ans = self.KyrillicUpto1000()

//		var pot3 = 0
//		var divisor = 1000
//		while true {
//			if stellen < divisor { break }
//			stellen = stellen / divisor
//			ans = stellenKyrillic49
//
//
//		}
		/*
		if self < 1000 { return ans }
		ans =  (self / 1000).KyrillicUpto1000(prefix: "҂") + ans
		
		if self < 1000000 { return ans }
		ans =  (self / 1000000).KyrillicUpto1000(prefix: " ⃝") + ans
		
		if self < 1000000000 { return ans }
		return ans
		*/
	}
}

public extension BigUInt {
	func Khmer() -> String {
		let d = ["០","១","២","៣","៤","៥","៦","៧","៨","៩"]
		var (stellen,ans) = (self,"")
		while stellen > 0 {
			ans = d[Int(stellen%10)] + ans
			stellen = stellen / 10
		}
		return ans
	}
}

public extension BigUInt {
    func Sanskrit() -> String {
        //Devanagari
        //https://en.wikipedia.org/wiki/Indian_numerals
        let d = ["०","१","२","३","४","५","६","७","८","९"]
        var (stellen,ans) = (self,"")
        while stellen > 0 {
            ans = d[Int(stellen%10)] + ans
            stellen = stellen / 10
        }
        return ans
    }
}


public extension BigUInt {
	func Keilschrift() -> String {
		var ans = ""
		var stellen = self
		while stellen > 0 {
			let digit = Int(stellen % 60)
			ans = Digit60(digit: digit) + "   " + ans
			stellen = stellen / 60
		}
		return ans
	}
	
	fileprivate func Digit60(digit : Int) -> String {
		
		let mod10 = digit % 10
		if (digit > 10) && (mod10 > 0) {
			let ans = Digit60(digit: digit - mod10) + Digit60(digit: mod10)
			return ans
		}
		
		switch digit {
		case 0:
			return "𒑊"
			
		case 1:
			return  "𒐕"
		case 2:
			return "𒐖"
		case 3:
			return "𒐗"
		case 4:
			return "𒐘"
		case 5:
			return "𒐙"
		case 6:
			return "𒐚"
		case 7:
			return "𒑂"
		case 8:
			return "𒑄"
		case 9:
			return "𒑆"
		case 10:
			return "𐏓"
		case 20:
			return "𐏓𐏓"
		case 30:
			return "𐏓𐏓𐏓"
		case 40:
			return "𒐏"
		case 50:
			return "𒐐"
		case 60:
			return "𒐑"
		case 70:
			return "𒐒"
		case 80:
			return "𒐓"
		case 90:
			return "𒐔"
		default:
			assert(false)
			return ""
		}
	}
}

public extension BigUInt {
	func Klingon() ->String {
	//https://en.wikipedia.org/wiki/Abjad_numerals
		
	//let onetonine = ["\u{F8F0}","\u{F8F1}","\u{F8F2}","\u{F8F3}","\u{F8F4}","\u{F8F5}","\u{F8F6}","\u{F8F7}","\u{F8F8}","\u{F8F9}"]
	let onetonine = ["\u{F8F0}","\u{F8F1}","\u{F8F2}","\u{F8F3}","\u{F8F4}","\u{F8F5}","\u{F8F6}","\u{F8F7}","\u{F8F8}",	""]

	var (stellen,ans) = (self,"")
	if self == 0 { return onetonine[0] }

	while stellen > 0 {
		let digit = Int(stellen%10)
		stellen = stellen / 10
		ans = onetonine[digit] + ans
		}
	
	return ans
	}
}

public extension BigUInt {
	func Kharoshthi() -> String {
		let base = ["","\u{10a40}","\u{10a41}","\u{10a42}","\u{10a43}"]
		let ten = "\u{10a44}"
		let twenty = "\u{10a45}"
		let hundred = "\u{10a46}"
		let thousand = "\u{10a47}"
		if self == 0 { return "" }
		if self < 10 {
			let d = Int(self%10)
			switch d {
			case 1:
				return base[1]
			case 2:
				return base[2]
			case 3:
				return base[3]
			case 4:
				return base[4]
			case 5:
				return  base[4] + base[1]
			case 6:
				return base[4] +  base[2]
			case 7:
				return base[4] + base[3]
			case 8:
				return base[4] + base[4]
			case 9:
				return  base[4]+base[4]+base[1]
			default:
				assert(false)
				return ""
			}
		}
		if self < 100 {
            let ans = (self%10).Kharoshthi()
			let prefix = Int(self/10)
			let prefixstr : String =  {
				switch prefix {
				case 1:
					return ten
				case 2:
					return twenty
				case 3:
					return twenty + ten
				case 4:
					return twenty + twenty
				case 5:
					return twenty + twenty + ten
				case 6:
					return twenty + twenty + twenty
				case 7:
					return twenty + twenty + twenty + ten
				case 8:
					return twenty + twenty + twenty + twenty
				case 9:
					return twenty + twenty + twenty + twenty + ten
				default:
					assert(false)
					return ""
				}
			}()
			return prefixstr + ans
		}
		if self < 1000 {
			var ans = (self%100).Kharoshthi()
			let h = self / 100
			ans = hundred + ans
			if h > 1 { ans =  h.Kharoshthi()  + ans }
			return ans
		}
		if self < 1000000 {
			var ans = (self%1000).Kharoshthi()
			let t = self / 1000
			ans = thousand + ans
			if t > 1 { ans = t.Kharoshthi() + ans }
			return ans
		}
 
        let k1 = (self % 1000000).Kharoshthi()
        let k2 = (self / 1000000).Kharoshthi()
        let ans = k2 + "𐩘" + k1
        return ans
 	}
}

public extension BigUInt {
	func DNA() -> String {
		
		let ACGT = ["A","C","G","T"]
		
		var (stellen,ans) = (self,"")
		while stellen > 0 {
			let d = Int(self % 4)
			ans = ACGT[d] + ans
			stellen = stellen / 4
		}
		return ans
		
	}
}
