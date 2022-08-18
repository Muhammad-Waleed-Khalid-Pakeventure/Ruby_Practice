require 'csv'

table=CSV.read("names.csv",headers:true)
for entry in table
    p entry
