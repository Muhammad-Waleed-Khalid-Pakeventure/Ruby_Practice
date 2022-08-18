class Account

    def initialize(name,username,password,id,type)
        @@count=@@count+1
        @name=name
        @username=username
        @password=password
        @id=id
        @type=type
    end
    def self.initialize()
        @@count=0
    end
end
class AccountList
    def initialize(filename)
        Table=CSV.read(filename,headers:true)
        @List=[]
        for i in table

    end

end