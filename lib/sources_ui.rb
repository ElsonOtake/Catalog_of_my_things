class UiSources
  def initialize(app)
    @app = app
  end

  def list_all_sources
    puts 'The sources list is empty!' if @app.list_sources.length.zero?
    @app.list_sources.each { |source| puts "Name: \"#{source.name}\"" }
  end
end
