# Provisionamento de usuários e grupos no Linux

Script que criei para um trabalho da faculdade (Computer Systems Analysis) sobre gerenciamento de usuários, grupos e permissões no Linux.

A ideia era simular uma empresa com 3 departamentos diferentes, cada um com seu próprio diretório, e garantir que ninguém de um setor consiga acessar os arquivos de outro.

## O que o script faz

Cria 3 grupos (administração, vendas e secretaria), distribui 9 usuários entre eles, e configura 4 diretórios com permissões diferentes:

- `/publico` - todo mundo pode ler, escrever e executar
- `/adm` - só quem é do grupo ADM
- `/ven` - só quem é do grupo VEN  
- `/sec` - só quem é do grupo SEC

Testei na prática rodando o script numa VPS Ubuntu que eu tinha disponível.

## Grupos e usuários

| Grupo | Usuários |
|---|---|
| GRP_ADM | carlos, maria, joao |
| GRP_VEN | debora, sebastiana, roberto |
| GRP_SEC | josefina, amanda, rogerio |

## Como rodar

```bash
chmod +x provisionamento.sh
./provisionamento.sh
```

Precisa rodar como root (ou com sudo) porque cria usuários do sistema.

## Testando se deu certo

Depois de rodar, testei tentando acessar os diretórios com usuários de grupos diferentes pra ver se realmente bloqueava:

```bash
su - roberto -c "ls /adm"
```

Deu `Permission denied`, que era o esperado já que o roberto é do grupo de vendas e tava tentando entrar no diretório da administração.

Fiz isso com todas as combinações possíveis (ven tentando entrar em adm e sec, adm tentando entrar em ven e sec, etc) e todas bloquearam corretamente.

## O que aprendi fazendo isso

Foi a primeira vez que mexi de verdade com permissões em Linux fora de tutorial - entender a diferença entre permissão do dono, do grupo e dos outros usuários ficou bem mais claro depois de testar na prática e ver o "Permission denied" aparecer (ou não aparecer, no caso do diretório público).

---

Lauren Freitas - [LinkedIn](https://www.linkedin.com/in/laurend-freitas)
