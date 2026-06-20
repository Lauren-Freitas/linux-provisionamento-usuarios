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

## Antes de rodar o script

Confirmei que o sistema estava limpo, sem nenhum dos usuários/grupos/diretórios que o script ia criar:

![Sistema antes](screenshots/01-antes.png)

## Como rodar

```bash
chmod +x provisionamento.sh
./provisionamento.sh
```

Precisa rodar como root (ou com sudo) porque cria usuários do sistema.

## Testando se deu certo

### Cada usuário acessando seu próprio diretório

Testei se carlos (ADM), roberto (VEN) e josefina (SEC) conseguiam acessar normalmente o diretório do próprio departamento, e se conseguiam criar arquivo no /publico:

![Acesso ao próprio diretório](screenshots/02-acesso-proprio.png)

### Isolamento entre departamentos

Essa foi a parte mais importante de testar - tentei acessar diretórios de outros departamentos com cada usuário pra confirmar que realmente bloqueava:

```bash
su - roberto -c "ls /adm"
```

![Testes de permission denied](screenshots/03-permission-denied.png)

Todas as 6 combinações possíveis (ven tentando entrar em adm e sec, adm tentando entrar em ven e sec, sec tentando entrar em adm e ven) deram `Permission denied`, como esperado.

## Subindo pro GitHub

Tudo isso eu fiz direto pelo terminal da VPS via SSH, sem interface gráfica nenhuma. Configurei o git com meu usuário e email, criei o repositório local e subi pro GitHub.

Pra autenticar pelo terminal, o git não aceita mais senha normal - precisei gerar um Personal Access Token nas configurações da conta (Settings > Developer settings > Personal access tokens) e usar ele no lugar da senha na hora do push. Na primeira tentativa deu erro 403 porque o token não tinha a permissão certa marcada.

![Processo completo no terminal](screenshots/04-git-processo.png)

Esse README também foi escrito direto no terminal com nano, sem sair da VPS em momento nenhum.

## O que aprendi fazendo isso

Foi a primeira vez que mexi de verdade com permissões em Linux fora de tutorial - entender a diferença entre permissão do dono, do grupo e dos outros usuários ficou bem mais claro depois de testar na prática e ver o "Permission denied" aparecer (ou não aparecer, no caso do diretório público).

Também foi a primeira vez que subi algo pro GitHub sem ser pela interface web - só terminal mesmo, incluindo a parte chata de descobrir que senha normal não funciona mais e que precisa de token.

---

Lauren Freitas - [LinkedIn](https://www.linkedin.com/in/laurend-freitas)
