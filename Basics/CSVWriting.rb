require 'csv'
CSV.open("cats.csv", "w") do |csv|
    csv << [:id, 1]
    csv << [:name, "Waleed"]
    csv << [:username, "waleed.khalid"]
end
