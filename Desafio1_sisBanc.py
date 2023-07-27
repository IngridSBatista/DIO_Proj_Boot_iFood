import os, time

menu = """
========== BANCO BANCO ==========
|                               |
|    Escolha sua operação:      |
|                               |
|     [1] Depósito              |
|     [2] Saque                 |
|     [3] Extrato               |
|     [0] Sair                  |
|                               |
=================================
\n"""
limite = 500
operacoes = 0
saldo = 0
extrato = []

while True:
    os.system("clear")
    print(menu)
    opcao = int(input(">  "))
    print(" ")

    if opcao == 0:  # sair
        print("Obrigada por utilizar o Banco Banco!_\n")
        break

    elif opcao == 1:  # deposito
        deposito = float(input("Informe o valor depositado: \n>  "))
        if deposito <= 0:
            print("Valor inválido. Tente novamente.")
            time.sleep(1.5)
        else:
            saldo += deposito
            print("Operação efetuada com sucesso.")
            extrato.append(f"| Depósito        R$ {deposito:10.2f} |")

            time.sleep(1.5)

    elif opcao == 2:  # saque
        if operacoes == 3:
            print("Limite de saques diários atingido.")
            time.sleep(1.5)
        else:
            saque = float(input("Informe o valor a sacar: \n>  "))
            if saque <= 0:
                print("Valor inválido. Tente novamente.")
                time.sleep(1.5)
            else:
                if saque > 500:
                    print("O valor informado excede o limite diário de R$ 500,00. Tente novamente.")
                    time.sleep(1.5)
                else:
                    if saque > saldo:
                        print("Não há saldo suficiente para efetuar a operação. Tente novamente.")
                        time.sleep(1.5)
                    else:
                        operacoes += 1
                        saldo -= saque
                        print("Operação efetuada com sucesso.")
                        extrato.append(f"| Saque         - R$ {saque:10.2f} |")

                    time.sleep(1.5)

    elif opcao == 3:  # extrato
        
        os.system("clear")

        print("=========== EXTRATO =============\n|                               |")
        
        if extrato == []:
            print("|  ***  Sem movimentações  ***  |")
        else:
            for movimento in extrato:
                print(movimento, end="")
                print()
        
        print("|                               |\n|                               |")
        print(f"| Saldo           R$ {saldo:10.2f} |")
        print("|                               |\n=================================")
        
        voltar = input("Pressione qualquer tecla para voltar ao menu \n>  ")
        if voltar != "":
            pass
    
    else:
        print("Opção inválida. Tente novamente.")
