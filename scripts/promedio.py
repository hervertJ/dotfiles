IA = (13.666 + 8 + 13)/3
ENRUTAMIENTO = 13.2
ELECTROMAGNETISMO = 14.6
LAB_ELECTRONICA = 13.7
DISPOS = 17.4
ESTOCASTICOS = 11.6

promedio = (DISPOS * 4 + ENRUTAMIENTO * 5 + LAB_ELECTRONICA + IA * 4 + ELECTROMAGNETISMO * 4 + ESTOCASTICOS * 4)/22

print(f"Prom. del ciclo: {promedio}")

# para turno 5 proemdio 12.7

print(f"Prom. para matrícula: {(promedio*22 + 11.5*25)/47}")
