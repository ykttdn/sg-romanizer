class SgRomanizer
  ONES_DIGIT_MAPPING = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX']
  TENS_DIGIT_MAPPING = ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC']
  HUNDREDS_DIGIT_MAPPING = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM']
  THOUSANDS_DIGIT_MAPPING = ['', 'M', 'MM', 'MMM']

  def romanize(arabic)
    ones_digit, tens_digit, hundreds_digit, thousands_digit = arabic.digits.push(0, 0, 0)

    THOUSANDS_DIGIT_MAPPING[thousands_digit] +
      HUNDREDS_DIGIT_MAPPING[hundreds_digit] +
      TENS_DIGIT_MAPPING[tens_digit] +
      ONES_DIGIT_MAPPING[ones_digit]
  end

  def deromanize(roman)
    arabic = 0
    index = 0

    [
      [THOUSANDS_DIGIT_MAPPING, 1000],
      [HUNDREDS_DIGIT_MAPPING, 100],
      [TENS_DIGIT_MAPPING, 10],
      [ONES_DIGIT_MAPPING, 1]
    ].each do |mapping, mul|
      mapping.reverse.each do |r|
        if roman[index..].start_with?(r)
          arabic += mapping.index(r) * mul
          index += r.length
          break
        end
      end
    end

    arabic
  end
end
