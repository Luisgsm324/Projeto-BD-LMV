import mysql.connector

def connect_to_database():
    try:
        # Informações para realizar conexão com o banco de dados
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
    while True:
        text = """-------------------------------------------
Insira a query desejada para executar: (Para sair, digite 5)
-------------------------------------------"""
        print(text)
        query = input()
        
        if query == '5':
            break

        if connection:
            print("-------------------------------------------\nResultado da query:\n-------------------------------------------")
            execute_query(connection, query)
            connection.close()

if __name__ == "__main__":
    main()