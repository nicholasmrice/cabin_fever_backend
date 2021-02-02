class User
    if ENV["DATABASE_URL"]
        PG.connect(ENV['DATABASE_URL'])
    elsif
        DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'cabin_fever_backend_development'})
    end

    def self.create(opts)
        results = DB.exec(
            <<-SQL
                INSERT INTO users (username, password)
                VALUES ('#{opts["username"]}', '#{opts["password"]}')
                RETURNING id, username, password;
            SQL
        )
    return {
         "id" => results.first["id"].to_i,
         "username" => results.first["username"],
         "password" => results.first["password"],
    }
    end
end
