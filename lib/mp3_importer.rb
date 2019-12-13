
class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        #binding.pry
        get_file_from_path
    end
    
    def import
        #binding.pry
        files.each{|filename|Song.new_by_filename(filename)}
    end

    def get_file_from_path
        Dir.entries(@path).select{|file| !File.directory? file} #Returns true if the named file is a directory
        #binding.pry
    end

end