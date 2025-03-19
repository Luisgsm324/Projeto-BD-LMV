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
            return connection
    except mysql.connector.Error as err:
        return False

def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        results = cursor.fetchall()

        # Lógica das colunas aqui :)
        columns = cursor.description
        colums_list = list()
        for column in columns:
            colums_list.append(column[0])
        
        cursor.close()
        return results, columns
    except mysql.connector.Error as err:
        cursor.close()
        return [], []


def main():
    connection = connect_to_database()
    while True:
        text = """-------------------------------------------
Insira a query desejada para executar: (Para sair, digite 5)
-------------------------------------------"""
        print(text)
        query = input()
        

        if connection:
            print("-------------------------------------------\nResultado da query:\n-------------------------------------------")
            execute_query(connection, query)
    connection.close()        

if __name__ == "__main__":
    main()