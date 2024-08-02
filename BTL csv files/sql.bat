@echo off

REM Activate Anaconda environment
call "C:\ProgramData\anaconda3\Scripts\activate.bat"

REM Check if Python is installed
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: Python is not installed on this system.
    pause
    exit /b
)

REM Prompt the user for the input CSV file path
set /p INPUT_CSV="Enter the path to your input CSV file: "

REM Extract the input file name without extension
for %%F in ("%INPUT_CSV%") do set "INPUT_FILENAME=%%~nF"

REM Generate the output file name
set OUTPUT_TXT=output_%INPUT_FILENAME%.txt

REM Run the Python script with specified arguments
python sql_import.py "%INPUT_CSV%" "%OUTPUT_TXT%"

REM Pause to keep the command prompt window open after execution
pause
