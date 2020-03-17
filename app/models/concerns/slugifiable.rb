
module Slugifiable 

  module Included 

    def slug
    array = self.title.split(" ")
    new_array = array.join("-").downcase
    new_array
    end

  end

  module Extended

    def self.find_by_slug(input)
    new_array = [] 
    array = input.split("-")
    array.each do |word|
      new_array << word.capitalize
    end
    final = new_array.join(" ")
    self.find_by("name like ?", final)
    end

  end 

end