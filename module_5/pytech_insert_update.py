""" 
    Title: pytech_insert.py
    Author: Professor Krasso
    Date: 10 July 2020
    Description: Test program for inserting new documents 
                 into the students collection 
"""

""" import statements """
from pymongo import MongoClient

# MongoDB connection string 
url = "mongodb+srv://admin:admin@cluster0.8bkb0.mongodb.net/pytech?retryWrites=true&w=majority"

# connect to the MongoDB cluster 
client = MongoClient(url)

# connect pytech database
db = client.pytech

""" three student documents"""
# Joe Smoe's data document 
joe = {
    "student_id": "1007",
    "first_name": "Joe",
    "last_name": "Smoe",
    "enrollments": [
        {
            "term": "Session 1",
            "gpa": "2.0",
            "start_date": "December 23, 2021",
            "end_date": "September 14, 2022",
            "courses": [
                {
                    "course_id": "CYBR410",
                    "description": "Database confusion",
                    "instructor": "Professor Clueless",
                    "grade": "D-"
                },
                {
                    "course_id": "CYBR420",
                    "description": "Programming with a tutor",
                    "instructor": "Professor Maggie",
                    "grade": "D+"
                }
            ]
        }
    ]

}

# Bilbo Baggins data document 
bilbo = {
    "student_id": "1008",
    "first_name": "Bilbo",
    "last_name": "Baggins",
    "enrollments": [
        {
            "term": "Session 2",
            "gpa": "3.52",
            "start_date": "July 10, 2020",
            "end_date": "September 14, 2020",
            "courses": [
                {
                    "course_id": "CSD310",
                    "description": "Database Development and Use",
                    "instructor": "Professor Krasso",
                    "grade": "B+"
                },
                {
                    "course_id": "CSD320",
                    "description": "Programming with Java",
                    "instructor": "Professor Krasso",
                    "grade": "A-"
                }
            ]
        }
    ]
}

# Frodo Baggins data document
frodo = {
    "student_id": "1009",
    "first_name": "Frodo",
    "last_name": "Baggins",
    "enrollments": [
        {
            "term": "Session 2",
            "gpa": "1.5",
            "start_date": "July 10, 2020",
            "end_date": "September 14, 2020",
            "courses": [
                {
                    "course_id": "CSD310",
                    "description": "Database Development and Use",
                    "instructor": "Professor Krasso",
                    "grade": "C"
                },
                {
                    "course_id": "CSD 320",
                    "description": "Programming with Java",
                    "instructor": "Professor Krasso",
                    "grade": "B"
                }
            ]
        }
    ]
}

# get the students collection 
students = db.students

# insert statements with output 
print("\n  -- INSERT STATEMENTS --")
joe_student_id = students.insert_one(joe).inserted_id
print("  Inserted student record Joe Smoe into the students collection with document_id " + str(joe_student_id))

bilbo_student_id = students.insert_one(bilbo).inserted_id
print("  Inserted student record Bilbo Baggins into the students collection with document_id " + str(bilbo_student_id))

frodo_student_id = students.insert_one(frodo).inserted_id
print("  Inserted student record Frodo Baggins into the students collection with document_id " + str(frodo_student_id))

input("\n\n  End of program, press any key to exit... ")