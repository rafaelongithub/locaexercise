#                     HighSchool Manager App
# The intention of this app is be able to manage an HighSchool in Brazil

class Student

  attr_reader :name, :years_old

  def initialize(name, years_old)
    @name  = name
    @years_old = years_old
  end
end

class SchoolClass

  attr_reader :students, :class_code, :teachers

  def initialize(class_code, year)
    @class_code = class_code
    @year = year
    @students = []
    @teachers = []
  end

  def enroll_a_studant(student)
    @students << student
  end

  def link_teacher_to_class(teacher)
    @teachers << teacher
  end

  def show_teachers()
    puts class_code
    @teachers.each do |teacher|
      puts teacher.name
    end
  end
end

class Employee

  attr_reader :name, :position

  def initialize(name, position)
    @name = name
    @position = position
  end
end

class Teacher < Employee

  attr_reader :name, :subject

  def initialize(name, subject)
    super(name, "Teacher")
    @subject = subject
  end
end

class_list = [SchoolClass.new(1001,1), SchoolClass.new(2001,2), SchoolClass.new(3001,3)]

class_list[0].enroll_a_studant(Student.new("Carlos Silva",15))
class_list[0].enroll_a_studant(Student.new("Felipe Almeida",16))
class_list[0].enroll_a_studant(Student.new("Henrique dos Santos",15))
class_list[0].enroll_a_studant(Student.new("Paulo Henrique",15))
class_list[0].enroll_a_studant(Student.new("Diogo",16))

class_list[1].enroll_a_studant(Student.new("João Carlos",16))
class_list[1].enroll_a_studant(Student.new("Fabio Oliveira",17))
class_list[1].enroll_a_studant(Student.new("Rogério Cabral",17))
class_list[1].enroll_a_studant(Student.new("Fernanda Silva",16))
class_list[1].enroll_a_studant(Student.new("Hudson Coutinho",17))

class_list[2].enroll_a_studant(Student.new("Gesica Rodrigues",18))
class_list[2].enroll_a_studant(Student.new("Tatiana Mendes",18))
class_list[2].enroll_a_studant(Student.new("Igo Nogueira",17))
class_list[2].enroll_a_studant(Student.new("Almeida Prado",17))
class_list[2].enroll_a_studant(Student.new("Silvia Cristina",18))

teachers_list = [Teacher.new("Camila","Português"),Teacher.new("Marcos","Matemática"),Teacher.new("Rafael","Física"),Teacher.new("Adriane","Artes Visuais")]

option = 1

while option != 0 do
  puts "0 - para encerrar"
  puts "1 - Cadastrar aluno e matricular em uma turmar"
  puts "2 - Visualizar Turma"
  puts "3 - Visualizar lista de professores e suas matérias"
  puts "4 - Criar turma"
  puts "5 - Cadastrar Professor"
  puts "6 - Vincular professor a turma"
  option = gets().to_i

  case option
  when 1
    puts "Entre com nome do novo aluno:"
    name = gets().chomp().to_s

    puts "Quantos anos ele tem:"
    years = gets().to_i
    student = Student.new(name, years)

    puts "Qual é o codigo da turma que deseja cadastar?"
    chosen_class = gets().to_i

    class_list.each do |school_class|
      if school_class.class_code == chosen_class
        school_class.enroll_a_studant(student)
        puts "Aluno cadastrado!"
        break
      end
    end
  when 2
    puts "Qual é o codigo da turma que deseja Visualizar?"
    chosen_class = gets().to_i

    class_list.each do |school_class|
      if school_class.class_code == chosen_class
        school_class.students.each do |studant|
          puts "Aluno #{studant.name} #{studant.years_old} anos."
        end
        school_class.teachers.each do |teacher|
          puts "Professor #{teacher.name} Matéria #{teacher.subject}"
        end
      end
    end
  when 3
    teachers_list.each do |teacher|
      puts "Professor #{teacher.name} matéria #{teacher.subject}."
    end
  when 4
    puts "Entre com codigo da turma."
    class_code = gets().to_i

    puts "Entre com o ano - 1 - Primeiro Ano, 2 - Segundo Ano, 3 - Terceiro Ano."
    year = gets().to_i

    class_list << SchoolClass.new(class_code, year)

    puts "Turma cadastrada com sucesso!"
  when 5
    puts "Digite o nome do professor:"
    name = gets().chomp().to_s

    puts "Digite a matéria:"
    subject = gets().chomp().to_s

    teachers_list << Teacher.new(name, subject)

    puts "Professor cadastrado com sucesso!"
  when 6
    puts "Qual professor deseja vincular, digite o nome:"
    teacher_chosen_name = gets().chomp().to_s

    teacher_found = ""

    teachers_list.each do |teacher|
      if teacher.name == teacher_chosen_name
        teacher_found = teacher
        break
      end
    end


    puts "A qual turmar deseja vincular o professor a ela? Digite o Codigo:"
    class_chosen = gets().to_i

    class_list.each do |school_class|
      if school_class.class_code == class_chosen
        school_class.link_teacher_to_class(teacher_found)
        school_class.show_teachers()
        break
      end
    end
  else
    puts "Digite uma opcao valida."
  end
end
