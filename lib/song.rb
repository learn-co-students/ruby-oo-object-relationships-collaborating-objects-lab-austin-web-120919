class Song

    
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        #binding.pry
        formatted_file = Song.format_filename(filename)
        new_song = self.new(formatted_file[1])
        #binding.pry
        new_song.artist_name = formatted_file[0]
        new_song 
    end

     def artist=(artist)
         @artist = artist
         artist.add_song(self)
     end

    def artist_name=(artist_name)
        self.artist=(Artist.find_or_create_by_name(artist_name))
        #artist.add_song(self)
    end

    def self.format_filename(filename)
        #binding.pry
        filename.chomp('.mp3').split(' - ')
    end


end