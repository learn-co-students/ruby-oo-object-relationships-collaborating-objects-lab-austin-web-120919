require 'pry'

class MP3Importer
    attr_accessor :path

    @@directory = []

    def initialize(file_path)
        @path = file_path

    end

    def files
        Dir.entries(@path).select{|f| !File.directory? f}
    end


    def import
        files.each do |el|
            song = Song.new_by_filename(el)
            #binding.pry
        end
    end



end