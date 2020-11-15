require 'pry'
class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def save
        @@all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.all
        @@all
    end

    def add_song(song)
        self.songs << song
        song.artist = self
    end

    # def self.find_or_create_by_name(name)
    #     #!self.all.include?(self)
    #     self.find(name) || self.create(name)
    # end

    # def self.find(name)
    #     self.all.find {|artist| artist.name == name}
    # end

    # def self.create(name)
    #     artist = Artist.new(name)
    #     artist.save
    #     artist
    # end
    def self.find_or_create_by_name(name)
        found_artist = all.find do |artist|
          artist.name == name
        end
        if found_artist.nil?
          Artist.new(name)
        else
          found_artist
        end
      end
      
    def print_songs
        self.songs.each {|song| puts song.name}
    end



end