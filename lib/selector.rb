module Selector
  DISPLAY_FORMATTERS = {
    'author' => ->(data) { "#{data.first_name} #{data.last_name}" },
    'label' => ->(data) { "#{data.title} #{data.color}" },
    'genre' => lambda(&:name),
    'source' => lambda(&:name)
  }.freeze

  def select_option(class_name, class_array)
    puts "Select a #{class_name} from the following list by number"
    formatter = DISPLAY_FORMATTERS[class_name]
    class_array.each_with_index { |data, index| puts "#{index}) #{formatter.call(data)}" }
  end

  def list_option(class_name, class_array)
    select_option(class_name, class_array)
    list_size = class_array.size
    @option = check_input('') { |input| input.match?(/^\d+$/) && input.to_i.between?(0, list_size - 1) }
  end
end
