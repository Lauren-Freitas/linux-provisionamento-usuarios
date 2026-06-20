#!/bin/bash

# ==============================================================
# Script de Provisionamento - Usuários, Grupos e Diretórios
# Autor: Lauren Freitas
# Descrição: Cria estrutura de diretórios departamentais com
#            permissões controladas por grupo, além de um
#            diretório público acessível a todos os usuários.
# ==============================================================

# --------------------------------------------------------------
# 1. CRIAÇÃO DOS GRUPOS
# --------------------------------------------------------------
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# --------------------------------------------------------------
# 2. CRIAÇÃO DOS USUÁRIOS E VÍNCULO COM SEUS GRUPOS
# --------------------------------------------------------------

# Grupo ADM
useradd -m -G GRP_ADM carlos
useradd -m -G GRP_ADM maria
useradd -m -G GRP_ADM joao

# Grupo VEN
useradd -m -G GRP_VEN debora
useradd -m -G GRP_VEN sebastiana
useradd -m -G GRP_VEN roberto

# Grupo SEC
useradd -m -G GRP_SEC josefina
useradd -m -G GRP_SEC amanda
useradd -m -G GRP_SEC rogerio

# --------------------------------------------------------------
# 3. CRIAÇÃO DOS DIRETÓRIOS NA RAIZ
# --------------------------------------------------------------
mkdir -p /publico
mkdir -p /adm
mkdir -p /ven
mkdir -p /sec

# --------------------------------------------------------------
# 4. DONO DOS DIRETÓRIOS = ROOT
# --------------------------------------------------------------
chown root:root /publico
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

# --------------------------------------------------------------
# 5. PERMISSÕES
# --------------------------------------------------------------

# /publico -> todos os usuários têm permissão total (leitura, escrita, execução)
chmod 777 /publico

# /adm, /ven, /sec -> permissão total APENAS para o dono (root) e o grupo
# Demais usuários (outros grupos) não têm nenhuma permissão
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

# --------------------------------------------------------------
# FIM DO SCRIPT
# --------------------------------------------------------------
echo "Provisionamento concluído com sucesso!"
echo "Grupos criados: GRP_ADM, GRP_VEN, GRP_SEC"
echo "Usuários criados: carlos, maria, joao, debora, sebastiana, roberto, josefina, amanda, rogerio"
echo "Diretórios criados: /publico (777), /adm (770), /ven (770), /sec (770)"


