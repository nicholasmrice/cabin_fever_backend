class Cabin
  DB = PG.connect({:host=>"localhost", :port => 5432, :dbname => 'cabin_fever_backend_development'})

  def self.all
      results = DB.exec("SELECT * FROM cabins;")
      return results.each do |result|
        {
          "id" => result["id"].to_i,
          "lattitude" => result["lattitude"],
          "longitude" => result["longitude"],
          "address" => result["address"],
          "image" => result["image"],
          "description" => result["description"],
          "amenities" => result["amenities"],
        }
      end
    end

  def self.find(id)
    results = DB.exec("SELECT * FROM cabins WHERE id=#{id};")
    return {
         "id" => result["id"].to_i,
         "lattitude" => result["lattitude"],
         "longitude" => result["longitude"],
         "address" => result["address"],
         "image" => result["image"],
         "description" => result["description"],
         "amenities" => result["amenities"],
    }
  end

  def self.create(opts)
    results = DB.exec(
        <<-SQL
            INSERT INTO cabins (lattitude, longitude, address, image, description, amenities)
            VALUES (
              #{opts["lattitude"]}, #{opts["longitude"]}, #{opts["address"]}, #{opts["image"]}, #{opts["description"]}, #{opts["amenities"]},  )
            RETURNING id, lattitude, longitude, address, image, description, amenities;
        SQL
    )
    return {
         "id" => results.first["id"].to_i,
         "lattitude" => results.first["lattitude"],
         "longitude" => results.first["longitude"],
         "address" => results.first["address"],
         "image" => results.first["image"],
         "description" => results.first["description"],
         "amenities" => results.first["amenities"],
    }
  end

  def self.delete(id)
    results = DB.exec("DELETE FROM cabins WHERE id=#{id};")
    return { "deleted" => true }
  end

  def self.update(id, opts)
    results = DB.exec(
        <<-SQL
            UPDATE cabins
              SET lattitude=#{opts["lattitude"]}, longitude=#{opts["longitude"]}, address=#{opts["address"]}, image=#{opts["image"]}, description=#{opts["description"]} amenities=#{opts["amenities"]},  
              WHERE id=#{id}
            RETURNING id, lattitude, longitude, address, image, description, amenities;
        SQL
    )
    return {
         "id" => results.first["id"].to_i,
         "lattitude" => results.first["lattitude"],
         "longitude" =>  results.first["longitude"],
         "address" => results.first["address"],
         "image" => results.first["image"],
         "description" => results.first["description"],
         "amenities" => results.first["amenities"],
    }
  end
end
