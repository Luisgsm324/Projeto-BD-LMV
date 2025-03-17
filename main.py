import mysql.connector

def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='123456',
            database='lmv'
        )
        if connection.is_connected():
            print("Connected to MySQL database")
            return connection
        
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None

def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        results = cursor.fetchall()
        for row in results:
            print(row)
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()

def main():
    connection = connect_to_database()
    if connection:
        queries = [
            "SELECT * FROM your_table1;",
            "SELECT * FROM your_table2;",
            # Add more queries as needed
        ]
        for query in queries:
            execute_query(connection, query)
        connection.close()

if __name__ == "__main__":
    main()