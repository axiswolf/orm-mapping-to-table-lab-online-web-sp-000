class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :id, :name, :grade
  def initialize(id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
    # creates the students table in the database
  end

  def self.drop_table
    # drops the students table form the database
  end

  def self.create
    # returns the new object that it instantiated
  end

end
