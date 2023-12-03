from flask import Flask, render_template, request, redirect
import mysql.connector
import webbrowser

app = Flask(__name__)

mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "",
    database = "tutoring"
)

mycursor = mydb.cursor()

sql = "SELECT * FROM courses"
mycursor.execute(sql)
courses = mycursor.fetchall()
courses = [x[0] for x in courses]

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/addStudent', methods=['GET', 'POST'])
def addStudent():
    if request.method == 'GET':
        return render_template("addStudent.html")
    else:
        studentID = request.form['student_id']
        firstName = request.form['first_name']
        lastName = request.form['last_name']

        sql = "INSERT INTO students (Student_ID, First_name, Last_name) VALUES (%s, %s, %s)"
        val = (studentID, firstName, lastName)

        mycursor.execute(sql, val)

        mydb.commit()

        return render_template("addStudent.html")
    
@app.route('/addSession', methods=['GET', 'POST'])
def addSession():

    if request.method == 'POST':
        student_id = request.form['student_id']
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        course_num = request.form['course_number']
        section = request.form['section']
        duration = request.form['duration']

        sql = "INSERT INTO sessions (student_id, First_Name, Last_Name, Course_Number, Section, Duration_Min) VALUES (%s, %s, %s, %s, %s, %s)"
        val = (student_id, first_name, last_name, course_num, section, duration)
        mycursor.execute(sql, val)

        mydb.commit()

        return render_template('index.html')

    else:
        return render_template('addSession.html', items=courses)
    
@app.route('/viewStats', methods=['GET', 'POST'])
def viewStats():
    return render_template('viewStats.html',studentInfo=[], items=courses)
    
@app.route('/viewClass', methods=['GET', 'POST'])
def viewClass():

    courseNumber = request.form['singleClass']

    sql = f"SELECT Section, sum(Duration_Min) FROM sessions WHERE Course_Number='{courseNumber}' GROUP BY Section ORDER BY Section;"
    mycursor.execute(sql)

    result = mycursor.fetchall()

    results = []

    for row in result:
        results.append((row[0], int(row[1])))

    return render_template('viewStats.html', studentInfo= [], tables = [0], title=[f"{courseNumber} Sections"], title2="Total Duration(minutes)", items=courses, courses=[results])

@app.route('/viewAllClasses', methods=['GET'])
def viewAllClasses():
    
    sql = "SELECT Course_Number, sum(Duration_Min) FROM sessions GROUP BY Course_Number ORDER BY sum(Duration_Min) DESC;"
    mycursor.execute(sql)

    result = mycursor.fetchall()

    results = []

    for row in result: 
        results.append((row[0], int(row[1])))

    return render_template('viewStats.html', studentInfo=[], tables=[0], title=["Course"], title2="Total Duration(minutes)", items=courses, courses=[results])

    

@app.route('/viewStudent', methods=['GET','POST'])
def viewStudent():
    
    studentID = request.form['student_id']

    tables = []
    courseNames = []
    results = []
    titles = []

    studentInfo = [studentID]

    sql = f"SELECT First_Name, Last_Name FROM students WHERE Student_ID='{studentID}';"
    mycursor.execute(sql)
    names = mycursor.fetchall()
    studentInfo.append(names[0][0])
    studentInfo.append(names[0][1])

    sql = f"SELECT DISTINCT Course_Number FROM sessions WHERE Student_ID='{studentID}';"
    mycursor.execute(sql)
    courseNames = mycursor.fetchall()
    courseNames = [x[0] for x in courseNames]

    for i, course in enumerate(courseNames):
        sql = f"SELECT Section, sum(Duration_Min) FROM sessions WHERE Course_Number='{course}' AND Student_ID='{studentID}' GROUP BY Section ORDER BY Section;"
        tables.append(i)

        tempResults = []

        titles.append(f'{course} Sections')

        mycursor.execute(sql)
        result = mycursor.fetchall()
        
        for row in result:
            tempResults.append((row[0], int(row[1])))
        
        results.append(tempResults)
        
    return render_template('viewStats.html', studentInfo=studentInfo, tables=tables, title=titles, title2="Total Duration(minutes)", items=courses, courses=results)


if __name__ == '__main__':
    webbrowser.open('http://127.0.0.1:5000/')
    app.run()