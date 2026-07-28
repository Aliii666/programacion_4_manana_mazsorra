def sumar(*numeros):
    total = sum(numeros)
    print(f"La suma es: {total}")

def mostrar_datos (**datos):
    for  clave, valor in datos.items():
        print(f"(clave): (valor)")

sumar(1,2,3,4,5)
mostrar_datos(nombres="Jesus", edad=48 , cuidad="Cuenca")    