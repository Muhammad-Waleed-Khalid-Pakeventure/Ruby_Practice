class Employee   
    @@no_of_employees = 0   
    def initialize(name)   
       @employee_name = name   
       @@no_of_employees += 1   
    end   
   
    def total_no_of_employees()   
      puts "Total number of employees: #@@no_of_employees"   
    end   
 end   
 
 # Create Objects   
 e1 = Employee.new("Emma")   
 e2 = Employee.new("David") 
 e3 = Employee.new("Harris") 
   
 # Call Methods   
 e1.total_no_of_employees()   
 e2.total_no_of_employees()   
 e3.total_no_of_employees()  