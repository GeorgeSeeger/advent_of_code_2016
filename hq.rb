class TaxiCab

  def initialize input
    @input = input
    @position = [0,0]
    @directions = [:north, :east, :south, :west]
    @dir_index = 0
    @dir = @directions[@dir_index]
  end

  def solve
    parse.each do |e|
      next_dir e[0]
      travel e[1..-1].to_i
    end
    @position.reduce(:+)
  end

  private

  def parse
    @input.split(", ")
  end

  def get_dir
    @dir = @directions[@dir_index]
  end

  def next_dir letter
    @dir_index += 1 if letter == 'R'
    @dir_index -= 1 if letter == 'L'
    @dir_index %= 4
    get_dir
  end

  def travel distance
    case @dir

    when :north
      @position = [@position[0] + distance, @position[1]]
    when :east
      @position = [@position[0], @position[1] + distance]
    when :south
      @position = [@position[0] - distance, @position[1]]
    when :west
      @position = [@position[0], @position[1] - distance]
    end
  end

end

p TaxiCab.new(File.open("input.txt").first).solve
