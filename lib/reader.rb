module Reader


  def reader_source
    unless File.exist?('data/source.json')
      File.open('data/source.json', 'w')
      return []
    end
    sources = []
    File.foreach('data/source.json') do |line|
      sources << JSON.parse(line, create_additions: true)
    end
    sources
  end

  def reader_label
    unless File.exist?('data/label.json')
      File.open('data/label.json', 'w')
      return []
    end
    labels = []
    File.foreach('data/label.json') do |line|
      labels << JSON.parse(line, create_additions: true)
    end
    labels
  end

  def reader_genre
    unless File.exist?('data/genre.json')
      File.open('data/genre.json', 'w')
      return []
    end
    genres = []
    File.foreach('data/genre.json') do |line|
      genres << JSON.parse(line, create_additions: true)
    end
    genres
  end

  def reader_author
    unless File.exist?('data/author.json')
      File.open('data/author.json', 'w')
      return []
    end
    authors = []
    File.foreach('data/author.json') do |line|
      authors << JSON.parse(line, create_additions: true)
    end
    authors
  end
end
