class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def add_song(song)
        song.artist = self
    end

    def songs 
        Song.all.select do |song|
            song.artist == self
        end
    end

    def self.find_or_create_by_name(name)
        if a = self.all.find do |artist|
            artist.name == name 
            artist
            end
            a 
        else
          Artist.new(name)
        end        
    end

    def print_songs
        self.songs.each do |song|
            puts "#{song.name}"
        end
    end

    def self.all 
        @@all
    end
end