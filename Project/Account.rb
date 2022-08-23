class Account
    @@userCount=0
    attr_accessor :username,:id,:password,:type,:is_deleted
    def initialize(id,username,password,type,is_deleted)
        @id=id if id != -1
        @id=@@userCount if id == -1
        @username=username
        @password=password
        @type=type
        @is_deleted=is_deleted
        @@userCount=@@userCount+1

    end

    def authenticate_user(username,password)
        return type if (@username==username and @@password==password)
        return 0
    end

end