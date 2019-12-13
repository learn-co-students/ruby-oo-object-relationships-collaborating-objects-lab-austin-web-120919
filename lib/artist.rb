class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end    
    
    def self.find_by_name(artist)
        self.all.detect{|a| a.name == artist}
    end

    def self.create_by_name(artist_name)
        artist = Artist.new(artist_name)
    end
    
    def self.find_or_create_by_name(artist)
        self.find_by_name(artist) || self.create_by_name(artist)
    end

    def print_songs
        Song.all.select {|song| puts song.name if song.artist == self }
    end

end