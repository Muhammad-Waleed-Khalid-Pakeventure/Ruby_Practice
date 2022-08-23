require "csv"
require "./Account_list.rb"


class Menu
    
    def run
        @list=Account_list.new("data.csv")
        option = 1
        while option!=0 do
            puts("1. Add New Account")
            puts("2. Authenticate User")
            puts("3. Remove User")
            puts("4. Print Users")
            puts("5. Print All Users")
            puts("0. Exit")
            puts("Enter Your Choice: ")
            option=gets.chomp().to_i
            add_new_account if option == 1
            authenticate_user if option == 2
            remove_user if option == 3
            print_users if option == 4
            print_all_users if option == 5
            puts(option)
        end
        @list.save("data.csv")

    end
    
    def add_new_account
        puts("Enter Username: ")
        u_name=gets.chomp()
        puts("Enter Password: ")
        u_password=gets.chomp()
        puts("Enter 1. for Simple User / 2. for Admin: ")
        option = gets.chomp().to_i
        @list.add_simple_account(u_name,u_password) if option == 1
        @list.add_Admin(u_name,u_password) if option == 2

    end
    def authenticate_user
        puts("Enter Username: ")
        u_name=gets.chomp()
        puts("Enter Password: ")
        u_password=gets.chomp()

        i = @list.authenticate_user(u_name,u_password)
        str = "is Simple Account" if i==1
        str = "is Admin Account" if i==2
        str = "is not authenticated" if i==0
        puts("#{u_name} #{str}") 
    end
    def remove_user
        puts("Enter Username: ")
        u_name=gets.chomp()
        puts("Enter Password: ")
        u_password=gets.chomp()
        if @list.delete(u_name,u_password) == 1
            puts("User Deleted")
        else
            puts("User Not Found")
        end
        
        
    end
    
    def print_users
        for i in @list.accounts_list
        p(i) if i.is_deleted==0
        end
    end
    def print_all_users
        for i in @list.accounts_list
        p(i)
        end
    end     

end


main=Menu.new()
main.run