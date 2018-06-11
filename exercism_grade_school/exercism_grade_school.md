[.background-color: #D81D4E]
[.header: #FFFFFF, Source Code Pro Medium]
[.text: #333333, Helvetica Neue Medium]

![inline 80%](https://www.dropbox.com/s/bun32vwuffb98za/exercism-logo.png?dl=1)

# [fit] Exercism: Grade School

---

![](https://www.dropbox.com/s/ypcpk03m2gyxg8t/bart-exercism.png?dl=1)

---
[.background-color: #D81D4E]
[.header: #FFFFFF, Source Code Pro Medium]
[.text: alignment(center), text-scale(6.0)]

![left filtered](https://www.dropbox.com/s/jzegn13gtumu9z1/bart-exercism-half-size.png?dl=1)

# [fit] School
# [fit] Roster
:school:

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(left), Source Code Pro Medium]

# [fit] School Roster
<br />

---
[.background-color: #D81D4E]
[.header: #FFFFFF, Source Code Pro Medium]
[.list: #FFFFFF, bullet-character(🎒), alignment(left)]
[.text: text-scale(1.3)]

# [fit] School Roster

- **_Add a student's name_** to the roster for a grade

---
[.background-color: #D81D4E]
[.header: #FFFFFF, Source Code Pro Medium]
[.list: #FFFFFF, bullet-character(🎒), alignment(left)]
[.text: text-scale(1.3)]

# [fit] School Roster

- **_Add a student's name_** to the roster for a grade
- **_Get a list of all students_** enrolled in a grade

---
[.background-color: #D81D4E]
[.header: #FFFFFF, Source Code Pro Medium]
[.list: #FFFFFF, bullet-character(🎒), alignment(left)]
[.text: text-scale(1.3)]

# [fit] School Roster

- **_Add a student's name_** to the roster for a grade
- **_Get a list of all students_** enrolled in a grade
- Get a **_sorted list_** of all students in **_all grades_**

---
[.background-color: #D81D4E]
[.header: #FFFFFF, Source Code Pro Medium]
[.text: alignment(center), text-scale(3.0)]

# :clapper:
## Take 1

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# Create a School Roster

```ruby
class School
  def initialize
    @roster = []
  end

  private

  attr_reader :roster
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] A Roster is filled with Enrollments

```ruby
> @roster
=> [
     { grade: 1, students: ["Paul", "RobC"] },
     { grade: 2, students: ["Nick"]) },
     { grade: 3, students: ["Cath", "RobH"]) }
   ]
```

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(center), text-scale(1.5), Helvetica Neue Medium]

![](https://www.dropbox.com/s/x5csw1msl6zz6k7/teaching-earth-day.jpg?dl=1)

# Add Student Name
# to Roster

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Roster

```ruby
def add(name, grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students] << name
  else
    roster << { grade: grade, students: [name] }
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Roster

```ruby, [.highlight: 1]
def add(name, grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students] << name
  else
    roster << { grade: grade, students: [name] }
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Roster

```ruby, [.highlight: 1-3]
def add(name, grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students] << name
  else
    roster << { grade: grade, students: [name] }
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Roster

```ruby, [.highlight: 4]
def add(name, grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students] << name
  else
    roster << { grade: grade, students: [name] }
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Roster

```ruby, [.highlight: 5]
def add(name, grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students] << name
  else
    roster << { grade: grade, students: [name] }
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Roster

```ruby, [.highlight: 6-7]
def add(name, grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students] << name
  else
    roster << { grade: grade, students: [name] }
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Roster

```ruby
def add(name, grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students] << name
  else
    roster << { grade: grade, students: [name] }
  end
end
```

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(center), text-scale(1.5), Helvetica Neue Medium]

![](https://www.dropbox.com/s/h0sqw1562az6csx/guitar-class.jpg?dl=1)

# Get list of students
# in a grade

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get list of students in a grade

```ruby
def students(grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students].sort
  else
    []
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get list of students in a grade

```ruby, [.highlight: 1]
def students(grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students].sort
  else
    []
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get list of students in a grade

```ruby, [.highlight: 1-3]
def students(grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students].sort
  else
    []
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get list of students in a grade

```ruby, [.highlight: 4-5]
def students(grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students].sort
  else
    []
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get list of students in a grade

```ruby, [.highlight: 6-7]
def students(grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students].sort
  else
    []
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get list of students in a grade

```ruby
def students(grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students].sort
  else
    []
  end
end
```

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(center), text-scale(1.5), Helvetica Neue Medium]

![](https://www.dropbox.com/s/uxmb6wz8bkbhslg/english-class.jpg?dl=1)

# Get sorted list of
# students in all grades

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get sorted list of students in all grades

```ruby
def students_by_grade
  roster
    .sort_by { |enrollment| enrollment[:grade] }
    .map do |enrollment|
      enrollment[:students] =
        enrollment[:students].sort
      enrollment
    end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get sorted list of students in all grades

```ruby, [.highlight: 1]
def students_by_grade
  roster
    .sort_by { |enrollment| enrollment[:grade] }
    .map do |enrollment|
      enrollment[:students] =
        enrollment[:students].sort
      enrollment
    end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get sorted list of students in all grades

```ruby, [.highlight: 2-3]
def students_by_grade
  roster
    .sort_by { |enrollment| enrollment[:grade] }
    .map do |enrollment|
      enrollment[:students] =
        enrollment[:students].sort
      enrollment
    end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get sorted list of students in all grades

```ruby, [.highlight: 4]
def students_by_grade
  roster
    .sort_by { |enrollment| enrollment[:grade] }
    .map do |enrollment|
      enrollment[:students] =
        enrollment[:students].sort
      enrollment
    end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get sorted list of students in all grades

```ruby, [.highlight: 4-7]
def students_by_grade
  roster
    .sort_by { |enrollment| enrollment[:grade] }
    .map do |enrollment|
      enrollment[:students] =
        enrollment[:students].sort
      enrollment
    end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get sorted list of students in all grades

```ruby
def students_by_grade
  roster
    .sort_by { |enrollment| enrollment[:grade] }
    .map do |enrollment|
      enrollment[:students] =
        enrollment[:students].sort
      enrollment
    end
end
```

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(center), text-scale(1.5), Helvetica Neue Medium]

# [fit] `exercism submit grade_school.rb`

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(center), text-scale(3.0), Source Code Pro Medium]

![inline 80%](https://www.dropbox.com/s/bun32vwuffb98za/exercism-logo.png?dl=1)

# DONE!

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(center), text-scale(3.0), Source Code Pro Medium]

![inline 80%](https://www.dropbox.com/s/bun32vwuffb98za/exercism-logo.png?dl=1)

# DONE?

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(left), Source Code Pro Medium]

# [fit] What gives?
<br />

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(left), Source Code Pro Medium]
[.list: #FFFFFF, bullet-character(🎒), alignment(left)]
[.text: text-scale(1.3)]

# [fit] What gives?

- Methods are kind of long...

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(left), Source Code Pro Medium]
[.list: #FFFFFF, bullet-character(🎒), alignment(left)]
[.text: text-scale(1.3)]

# [fit] What gives?

- Methods are kind of long...
- Is the naming right...?

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(left), Source Code Pro Medium]
[.list: #FFFFFF, bullet-character(🎒), alignment(left)]
[.text: text-scale(1.3)]

# [fit] What gives?

- Methods are kind of long...
- Is the naming right...?
- There's code repetition...

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(left), Source Code Pro Medium]
[.list: #FFFFFF, bullet-character(🎒), alignment(left)]
[.text: text-scale(1.3)]

# [fit] What gives?

- Methods are kind of long...
- Is the naming right...?
- There's code repetition...
- Doesn't _feel_ Ruby-ish...

---
[.background-color: #D81D4E]
[.header: #FFFFFF, Source Code Pro Medium]
[.text: alignment(center), text-scale(3.0)]

# :clapper:
## Take 2

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# Create a School Roster

```ruby
class School
  def initialize
    @roster = []
  end

  private

  attr_reader :roster
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] A Roster is filled with Enrollments

```ruby
> @roster
=> [
     { grade: 1, students: ["Paul", "RobC"] },
     { grade: 2, students: ["Nick"]) },
     { grade: 3, students: ["Cath", "RobH"]) }
   ]
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Simplify to a Hash of Enrollments

```ruby
> @enrollments
=> {
     1 => ["Paul", "RobC"],
     2 => ["Nick"],
     3 => ["Cath", "RobH"]
   }
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# Create a Hash of Enrollments

```ruby
class School
  def initialize
    @enrollments = {}
  end

  private

  attr_reader :enrollments
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Roster

```ruby
def add(name, grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students] << name
  else
    roster << { grade: grade, students: [name] }
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Roster

```ruby, [.highlight: 2-3]
def add(name, grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students] << name
  else
    roster << { grade: grade, students: [name] }
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Roster

```ruby, [.highlight: 4-8]
def add(name, grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students] << name
  else
    roster << { grade: grade, students: [name] }
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get list of students in a grade

```ruby
def students(grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students].sort
  else
    []
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get list of students in a grade

```ruby, [.highlight: 2-3]
def students(grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students].sort
  else
    []
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get list of students in a grade

```ruby, [.highlight: 4-8]
def students(grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students].sort
  else
    []
  end
end
```

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(center), text-scale(1.5), Helvetica Neue Medium]

![](https://www.dropbox.com/s/t4eujehrsmcvpyg/kids-in-seats.jpg?dl=1)

# Too much
# repetition

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# Create a Hash of Enrollments

```ruby
class School
  def initialize
    @enrollments = {}
  end

  private

  attr_reader :enrollments
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# Create a Hash of Enrollments

```ruby
class School
  def initialize
    @enrollments =
      Hash.new { |hash, key| hash[key] = [] }
  end

  private

  attr_reader :enrollments
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# Create a Hash of Enrollments

```ruby, [.highlight: 4]
class School
  def initialize
    @enrollments =
      Hash.new { |hash, key| hash[key] = [] }
  end

  private

  attr_reader :enrollments
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Roster

```ruby
def add(name, grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students] << name
  else
    roster << { grade: grade, students: [name] }
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Add Student Name to Enrollments
<br />

```ruby
def add(name, grade)
  enrollments[grade] << name
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get list of students in a grade

```ruby
def students(grade)
  grade_enrollment =
    roster.find { |enrollment| enrollment[:grade] == grade }
  if grade_enrollment
    grade_enrollment[:students].sort
  else
    []
  end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get list of students in a grade
<br />

```ruby
def students(grade)
  enrollments[grade].sort
end
```

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(left), text-scale(3.5), Helvetica Neue Medium]

![](https://www.dropbox.com/s/8v3bljsi7l090fu/surprised-boy.jpg?dl=1)

# OMG
<br />

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get sorted list of students in all grades

```ruby
def students_by_grade
  roster
    .sort_by { |enrollment| enrollment[:grade] }
    .map do |enrollment|
      enrollment[:students] =
        enrollment[:students].sort
      enrollment
    end
end
```

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get sorted list of students in all grades

```ruby
def students_by_grade
  enrollments.sort.map do |grade, students|
    { grade: grade, students: students.sort }
  end
end
```
---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(left), text-scale(1.5), Helvetica Neue Medium]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# [fit] Get sorted list of students in all grades

```ruby
> school.students_by_grade
=> [
     { grade: 1, students: ["Paul", "RobC"] },
     { grade: 2, students: ["Nick"]) },
     { grade: 3, students: ["Cath", "RobH"]) }
   ]
```

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(center), text-scale(1.5), Helvetica Neue Medium]

# You'll rarely get it right
# the first time

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(center), text-scale(1.5), Helvetica Neue Medium]

# Submit often,
# get feedback

---
[.background-color: #D81D4E]
[.header: #FFFFFF, alignment(center), text-scale(1.5), Helvetica Neue Medium]

# Read other
# people's code

---
[.background-color: #FFFFFF]
[.header: #D81D4E, alignment(center), text-scale(1.5), Helvetica Neue Medium]

# Refactor until
# you're happy

---
[.background-color: #D81D4E]
[.header: #FFFFFF, Source Code Pro Medium]
[.text: #FFFFFF, Helvetica Neue Medium]
[.list: #FFFFFF, bullet-character(🎒), alignment(left)]

![inline 80%](https://www.dropbox.com/s/bun32vwuffb98za/exercism-logo.png?dl=1)

- `http://exercism.io/teams/rorosyd/streams/tracks/ruby/exercises/grade-school`
- `https://github.com/paulfioravanti/exercism`

---
[.background-color: #D81D4E]
[.header: #FFFFFF, Source Code Pro Medium]

![right](https://www.dropbox.com/s/5w770gu31uw33l9/nekobus_headshot.jpeg?dl=1)

# [fit] Thanks!
# [fit] __`@paulfioravanti`__
