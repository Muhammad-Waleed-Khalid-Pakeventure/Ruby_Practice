require "csv"
require "./Account.rb"
class Account_list
    attr_accessor :no_of_accounts,:accounts_list
    def initialize(filename)
        @accounts_list=[]
        @no_of_accounts=0
        table=CSV.read(filename,headers:true)
        for row in table
            id=row["id"].to_i
            u_name=row["username"]
            u_password=row["password"]
            type=row["type"].to_i
            is_deleted=row["is_deleted"].to_i
            acc=Account.new(id,u_name,u_password,type,is_deleted)
            @no_of_accounts=@no_of_accounts+1            
            @accounts_list << acc
        end
        
        
    end

    def add_simple_account(username,password)
        acc=Account.new(-1,username,password,1,0)
        @accounts_list<<acc
        @no_of_accounts=@no_of_accounts+1
    end

    def add_Admin(username,password)
        acc=Account.new(-1,username,password,2,0)
        @accounts_list<<acc
        @no_of_accounts=@no_of_accounts+1
    end

    def delete(username,password)
        i=0
        while i<@accounts_list.length do
            if(@accounts_list[i].username==username and @accounts_list[i].password==password)
                @accounts_list[i].is_deleted=1
                return 1
            end
            i=i+1
        end
        return 0
    end
    def print_account
        for i in @accounts_list
            p i
        end
    end
    def authenticate_user(username,password)
        for i in @accounts_list
            auth=i.authenticate_user(username,password)
            if auth != 0
                return auth
            end
        end
        return 0
    end
    def save(filename)

        CSV.open(filename,"w") do |csv|
            csv<<["id","username","password","type","is_deleted"]
            for i in @accounts_list
                csv<<[i.id,i.username,i.password,i.type,i.is_deleted]
            end
        end
    end
end
