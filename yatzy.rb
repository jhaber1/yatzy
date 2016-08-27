class Yatzy

  class << self

    def chance(*dice)
      dice.inject(0, :+)
    end

    def yatzy(*dice)
      ary = []
      dice.each { |d| return 0 if (ary << d).uniq.size > 1 }
      50
    end

    [
      [:ones, 1],
      [:twos, 2],
      [:threes, 3],
      [:fours, 4],
      [:fives, 5],
      [:sixes, 6]
    ].each do |method, num|
      define_method(method) { |*dice| sum_upper_section_for(dice, num) }
    end

    private

    # Upper section refers to the traditional Yatzy scorecard
    def sum_upper_section_for(dice, n)
      dice.select { |i| i == n }.inject(0, :+)
    end
  end
end