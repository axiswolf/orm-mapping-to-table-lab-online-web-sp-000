class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :id, :name, :grade
  attr_reader :id
  def initialize(id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end
  def save
    # saves an instance of the Student class to the database
    sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?,?)
    SQL
    DB[:conn].execute(sql, self.name, self.grade)
  end
  def self.create_table
    # creates the students table in the database
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students(
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
      )
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    # drops the students table form the database
  end

  def self.create(name:, grade:)
    # returns the new object that it instantiated
    student = Student.new(name, grade)
    student.save
    student
  end

end
