class Student
  
  class Student
  attr_accessor :id, :name, :grade

  def self.new_from_db(row)
    # create a new Student object given a row from the database	
    student = Student.new
    student.id = row[0]
    student.name = row[1]
    student.grade = row[2]
    student
  end
  
  def self.all
    sql = <<-SQL
      SELECT * FROM students;
     SQL
    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    end

  def self.all_students_in_grade_9
    sql = <<-SQL
    SELECT * FROM students WHERE grade = 9;
     SQL
    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    
    end 
  end
    