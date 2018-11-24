class School
  def initialize
    @store = Hash.new { [] }
  end

  def students(grade)
    @store[grade]
  end

  def students_by_grade
    @store.reduce([]) do |accum, (grade,students)|
      accum << { grade: grade, students: students }
    end.sort_by {|grd| grd[:grade] }
  end

  def add(student, grade)
    if no_students?(grade)
      @store[grade] = [student]
    else
      add_student_alphabetically(grade, student)
    end
  end

  private

  def no_students?(grade)
    @store[grade].length == 0
  end

  def add_student_alphabetically(grade, student)
    i = (nxt = @store[grade].bsearch {|s| s > student}) ? @store[grade].index(nxt) : -1
    @store[grade].insert(i, student)
  end
end
