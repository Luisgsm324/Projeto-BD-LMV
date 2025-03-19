import tkinter as tk
from tkinter import ttk
from tkinter import scrolledtext, messagebox
from decimal import Decimal
from functions import *

def exibir_tabela(colunas, conteudo):
    for row in tabela.get_children():
        tabela.delete(row)

    tabela["columns"] = colunas
    tabela.column("#0", width=0, stretch=tk.NO)

    for coluna in colunas:
        tabela.heading(coluna, text=coluna)
        tabela.column(coluna, width=100, anchor="center")

    
    for i, linha in enumerate(conteudo):
        tabela.insert("", "end", values=linha)

def call_query():
    query = text_area.get("1.0", tk.END).strip() 
    content, columns = execute_query(connection, query)

    if not query:
        messagebox.showwarning("Aviso", "Não é possível executar uma query vazia :(")
        return
    formated_columns = []
    for column in columns:
        formated_columns.append(column[0])
    print(f"Colunas: {columns}")
    print(f"Colunas formatadas: {formated_columns}")
    print(f"Conteúdo: {content}")

    if len(content) > 0:
        exibir_tabela(formated_columns, content)
    else:
        messagebox.showerror("Aviso", "Nenhum resultado foi encontrado com essa query :(")

connection = connect_to_database()

if not connection:
    messagebox.showerror("Erro", "Não foi possível conectar ao banco de dados :(")
    
root = tk.Tk()
root.title("Buscador de Dados LMV")

TITTLE_STYLE = {
    "font": ("Arial", 22, "bold"), 
    "fg": "blue",                    
    "bg": "lightgray",               
    "padx": 10,                      
    "pady": 5                        
}

titulo = tk.Label(root, text="Interface de Query", **TITTLE_STYLE)
titulo.pack(fill="x", pady=10)

label_query = tk.Label(root, text="Insira a sua query aqui: :D")
label_query.pack(pady=5)

text_area = scrolledtext.ScrolledText(root, wrap=tk.WORD, width=50, height=10)
text_area.pack(pady=5)

botao_executar = tk.Button(root, text="Rodar Query", command=call_query)
botao_executar.pack(pady=10)

tabela = ttk.Treeview(root)
tabela.pack(pady=10, fill="both", expand=True)

root.mainloop()

connection.close()