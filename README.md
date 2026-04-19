# Student Management System — Java OOP Project

## How to Compile & Run

```
cd C:\Users\hp\Desktop\JavaProject
compile.bat        ← compiles all files into out/
run.bat            ← runs the program
```

Or manually:
```
javac -d out -sourcepath src src\com\sms\main\StudentManagementSystem.java
java -cp out com.sms.main.StudentManagementSystem
```

## Project Structure
```
JavaProject/
├── compile.bat
├── run.bat
├── README.md
└── src/
    └── com/sms/
        ├── exceptions/
        │   ├── StudentNotFoundException.java   (checked exception)
        │   ├── InvalidMarksException.java      (runtime exception)
        │   └── DuplicateStudentException.java  (checked exception)
        ├── interfaces/
        │   ├── StudentOperations.java          (CRUD interface)
        │   └── Reportable.java                 (report interface)
        ├── model/
        │   ├── Person.java                     (abstract base class)
        │   ├── Student.java                    (extends Person)
        │   ├── GraduateStudent.java            (extends Student)
        │   └── Marks.java                      (marks + grade calc)
        ├── service/
        │   ├── StudentService.java             (implements StudentOperations)
        │   └── ReportService.java              (implements Reportable)
        ├── filehandling/
        │   └── FileHandler.java                (read/write/backup/log)
        ├── threads/
        │   ├── AutoSaveThread.java             (extends Thread)
        │   └── BackupThread.java               (implements Runnable)
        ├── util/
        │   └── ConsoleUtils.java               (input/display helpers)
        └── main/
            └── StudentManagementSystem.java    (entry point, menu)
```
