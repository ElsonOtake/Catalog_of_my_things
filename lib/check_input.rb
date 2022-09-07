module CheckInput
  def check_input(str)
    loop do
      print str
      @option = gets.chomp.strip
      break if yield
    end
    @option
  end
end
