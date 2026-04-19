@echo off
REM =========================================================
REM  compile.bat — Compiles all Java source files
REM  Run this from: C:\Users\hp\Desktop\JavaProject\
REM =========================================================

echo.
echo  [1/3] Creating output directory...
if not exist "out" mkdir out

echo  [2/3] Compiling all source files...
javac -d out -sourcepath src ^
  src\com\sms\exceptions\StudentNotFoundException.java ^
  src\com\sms\exceptions\InvalidMarksException.java ^
  src\com\sms\exceptions\DuplicateStudentException.java ^
  src\com\sms\interfaces\StudentOperations.java ^
  src\com\sms\interfaces\Reportable.java ^
  src\com\sms\model\Marks.java ^
  src\com\sms\model\Person.java ^
  src\com\sms\model\Student.java ^
  src\com\sms\model\GraduateStudent.java ^
  src\com\sms\filehandling\FileHandler.java ^
  src\com\sms\threads\AutoSaveThread.java ^
  src\com\sms\threads\BackupThread.java ^
  src\com\sms\service\StudentService.java ^
  src\com\sms\service\ReportService.java ^
  src\com\sms\util\ConsoleUtils.java ^
  src\com\sms\main\StudentManagementSystem.java

if %ERRORLEVEL% == 0 (
    echo  [3/3] Compilation SUCCESSFUL! Classes saved to 'out\'
    echo.
    echo  To run: run.bat
) else (
    echo  [3/3] Compilation FAILED. Check errors above.
)
echo.
