# ============================================================
#   STUDENT MANAGEMENT SYSTEM — COMPLETE PROJECT INFO
#   Language : Java | Type: Console Application
#   Location : C:\Users\hp\Desktop\JavaProject
# ============================================================


## PROJECT NAME
    Student Management System (SMS)


## HOW TO COMPILE & RUN
    Step 1: Open Command Prompt (Win + R → type cmd → Enter)
    Step 2: cd C:\Users\hp\Desktop\JavaProject
    Step 3: javac -d out -sourcepath src src\com\sms\main\StudentManagementSystem.java
    Step 4: java -cp out com.sms.main.StudentManagementSystem

    OR simply double-click:
        compile.bat   → compiles the project
        run.bat       → runs the project


## FOLDER STRUCTURE
    JavaProject/
    ├── compile.bat                   ← compile script
    ├── run.bat                       ← run script
    ├── README.md
    ├── PROJECT_INFO.md               ← this file
    ├── students.csv                  ← student data (auto-created)
    ├── students_backup.csv           ← backup file
    ├── sms_log.txt                   ← activity log
    └── src/
        └── com/
            └── sms/
                ├── exceptions/
                │   ├── StudentNotFoundException.java
                │   ├── InvalidMarksException.java
                │   └── DuplicateStudentException.java
                ├── interfaces/
                │   ├── StudentOperations.java
                │   └── Reportable.java
                ├── model/
                │   ├── Person.java
                │   ├── Student.java
                │   ├── GraduateStudent.java
                │   └── Marks.java
                ├── service/
                │   ├── StudentService.java
                │   └── ReportService.java
                ├── filehandling/
                │   └── FileHandler.java
                ├── threads/
                │   ├── AutoSaveThread.java
                │   └── BackupThread.java
                ├── util/
                │   └── ConsoleUtils.java
                └── main/
                    └── StudentManagementSystem.java


## ALL 16 FILES — EXPLAINED

    1. StudentManagementSystem.java  [main]
       → Entry point of the program
       → Shows the menu and handles user choices
       → Starts background threads on launch

    2. Person.java  [model]
       → Abstract base class
       → Has: id, name, age, email, phone
       → Cannot be created directly (abstract)
       → All other person classes extend this

    3. Student.java  [model]
       → Extends Person
       → Has: course, department, enrollmentYear, marks
       → 3 overloaded constructors
       → Saves/loads from CSV file

    4. GraduateStudent.java  [model]
       → Extends Student (3-level inheritance)
       → Extra fields: researchTopic, advisorName, thesisSubmitted
       → Overrides getRole() → "Graduate Student"

    5. Marks.java  [model]
       → Stores marks for 5 subjects
       → Calculates: total, percentage, grade
       → Grade scale: A+(90+), A(80+), B(70+), C(60+), D(50+), F(<50)
       → Subjects: Math, Science, English, History, Computer Science

    6. StudentOperations.java  [interfaces]
       → Interface (contract) for CRUD operations
       → Methods: addStudent, updateStudent, deleteStudent,
                  searchStudent, getAllStudents
       → Has default method: printStudentCount()
       → Has static method: isValidId()

    7. Reportable.java  [interfaces]
       → Interface for generating reports
       → Methods: generateReport(list), generateReport(student),
                  generateTopPerformersReport()

    8. StudentService.java  [service]
       → Implements StudentOperations interface
       → All business logic lives here
       → Handles: add, update, delete, search, marks, statistics

    9. ReportService.java  [service]
       → Implements Reportable interface
       → Generates: full report, grade chart,
                    top performers, subject report, rank list

    10. FileHandler.java  [filehandling]
        → Saves students to students.csv
        → Loads students from students.csv on startup
        → Creates backup using byte streams
        → Writes activity log to sms_log.txt

    11. AutoSaveThread.java  [threads]
        → Extends Thread class
        → Runs in background, saves data every 60 seconds
        → Is a daemon thread (stops when app exits)

    12. BackupThread.java  [threads]
        → Implements Runnable interface
        → Creates backup file when you press menu option 7
        → Uses synchronized to prevent double-backup

    13. ConsoleUtils.java  [util]
        → Helper for reading user input safely
        → Validates numbers, strings, ranges
        → Shows formatted messages (success, error, info)

    14. StudentNotFoundException.java  [exceptions]
        → Custom checked exception
        → Thrown when student ID is not found

    15. InvalidMarksException.java  [exceptions]
        → Custom runtime exception
        → Thrown when marks are outside 0–100

    16. DuplicateStudentException.java  [exceptions]
        → Custom checked exception
        → Thrown when adding a student with existing ID


## MENU OPTIONS

    1 → Add Student         (Regular or Graduate)
    2 → Update Student      (change name, email, course, etc.)
    3 → Delete Student      (confirm before delete)
    4 → Search Student      (by ID, Name, or Course)
    5 → Enter/Update Marks  (5 subjects, grade auto-calculated)
    6 → Generate Reports    (full, grade chart, top performers, rank)
    7 → Backup Data         (creates students_backup.csv)
    8 → View System Log     (shows all activity history)
    9 → System Statistics   (count, average, thread status)
    0 → Exit                (saves data before closing)


## OOP CONCEPTS USED

    Concept               | File(s)
    ----------------------|------------------------------------------
    Abstract Class        | Person.java
    Inheritance           | Student extends Person
                          | GraduateStudent extends Student
    Interface             | StudentOperations, Reportable
    Method Overloading    | Marks.setMark(), ConsoleUtils.readInt(),
                          | ReportService.generateReport()
    Method Overriding     | getRole(), getDisplayInfo(), toString()
    this keyword          | All constructors and setters
    super keyword         | GraduateStudent constructor and methods
    Static Members        | Student.totalCreated, Marks.SUBJECT_NAMES
    Final Variables       | Person.id, Marks.SUBJECT_COUNT
    Custom Exceptions     | 3 exception classes
    throws keyword        | addStudent(), saveStudents(), setMarks()
    finally block         | FileHandler.loadStudents()
    try-with-resources    | FileHandler save/read methods
    File I/O Streams      | BufferedReader, BufferedWriter,
                          | FileInputStream, FileOutputStream
    Multithreading        | AutoSaveThread, BackupThread
    Packages              | 8 packages under com.sms
    Encapsulation         | private fields + getters/setters in all models


## SAMPLE OUTPUT

    ╔══════════════════════════════════════════════════════╗
    ║       STUDENT MANAGEMENT SYSTEM  v1.0               ║
    ╚══════════════════════════════════════════════════════╝

    [FileHandler] Loaded 2 student(s) from students.csv
    ✔  System initialized successfully.

    MAIN MENU
    1. Add Student
    2. Update Student
    ...
    Enter choice: 5

    Enter Student ID: 101
    Mathematics      : 88
    Science          : 92
    English          : 76
    History          : 84
    Computer Science : 95

    ✔  Marks saved. Grade: A (87.00%)

    FULL REPORT:
    ID    Name          Course           Year  Avg%   Grade
    101   Alice Johnson B.Sc CS          2023  87.00  A
    102   Bob Smith     B.Com            2022  71.80  B


## GRADE SCALE

    Percentage    Grade
    ----------    -----
    90 – 100   →  A+
    80 – 89    →  A
    70 – 79    →  B
    60 – 69    →  C
    50 – 59    →  D
    Below 50   →  F


## AUTO-GENERATED FILES (appear after first run)

    students.csv          → All student data stored here
    students_backup.csv   → Copy created when you press menu 7
    sms_log.txt           → Timestamped log of all actions


## VIVA QUESTIONS (Top 10)

    Q1. What is an abstract class?
    A.  A class that cannot be instantiated. Has abstract methods
        that subclasses must implement. Example: Person.java

    Q2. What is the difference between interface and abstract class?
    A.  Abstract class can have fields, constructors, and code.
        Interface only defines method signatures (contract).

    Q3. What is method overloading?
    A.  Same method name with different parameters.
        Example: readInt(prompt) and readInt(prompt, min, max)

    Q4. What is method overriding?
    A.  Subclass provides its own version of a parent's method.
        Example: GraduateStudent overrides getRole() from Student.

    Q5. What is the difference between this and super?
    A.  'this' refers to current object.
        'super' refers to parent class object.

    Q6. What is a checked vs unchecked exception?
    A.  Checked: must be handled (StudentNotFoundException).
        Unchecked: runtime, optional handling (InvalidMarksException).

    Q7. What is the finally block?
    A.  Always runs after try/catch, used for cleanup.
        Used in FileHandler to close file readers.

    Q8. What is multithreading?
    A.  Running multiple tasks simultaneously.
        AutoSaveThread saves data every 60s while you use the menu.

    Q9. What is a static member?
    A.  Belongs to the class, not an object.
        Student.totalCreated counts all students created.

    Q10. What is a final variable?
     A.  Cannot be changed once set.
         Person.id is final — student ID never changes.


## SUBJECTS (5 total)

    1. Mathematics
    2. Science
    3. English
    4. History
    5. Computer Science


## AUTHOR INFO

    Project  : Student Management System
    Language : Java
    Concepts : Full OOP + File I/O + Multithreading + Exceptions
    Files    : 16 Java files across 8 packages
    Purpose  : Academic project demonstrating all core Java concepts
