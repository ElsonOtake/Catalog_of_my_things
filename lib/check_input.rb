module CheckInput
  def check_input(str)
    loop do
      print str
      @option = gets.chomp.strip
      break if yield(@option)
    end
    @option
  end
end
