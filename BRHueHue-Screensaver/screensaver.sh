#!/bin/bash

#Carlos Eduardo S.M
#14/01/2016
#Rio de Janeiro RJ - Brasil
#Contato: carlinhosedubr@gmail.com
#Script/Programa protetor de tela BRHueHue Screensaver

#############################################################################################################################################
#Limpa arquivos de execu��es anteriores, se n�o existirem apresenta mensagem de erro de n�o exist�ncia mas a execu��o geral se d� normalmente.

rm log_anterior.log
rm mouse.log
rm teclado.log
rm tempo_ocioso.log
rm nohup.out

############################################################################################################################################

############################################################################################################################################
#Aqui � executado em segundo plano o utilit�rio xinput (que faz parte do projeto Xorg) para gerar logs de uso do mouse e teclado no Xwindows.
#Para saber o n�mero id correspondente ao teclado ou ao mouse use "xinput list". Para mais op��es "man xinput" ou "xinput --help".

#Fazer o xinput ficar monitorando o mouse em segundo plano e escrevendo um log que ser� lido.
nohup xinput test 9 >> mouse.log &

#Fazer o xinput ficar monitorando o teclado em segundo plano e escrever um log que ser� lido.
nohup xinput test 8 >> teclado.log &
############################################################################################################################################

############################################################################################################################################
#Verificar o n�mero de linhas(n�mero de a��es do mouse e teclado) e criar um log para posterior compara��o com futuros n�meros de log.
#O que isso faz basicamente � contar o n�mero de linhas do log do teclado e do mouse e por o resultado em um log �nico.
cat teclado.log mouse.log | wc -l > log_anterior.log
############################################################################################################################################

############################################################################################################################################
#Aqui n�s pegamos o conte�do do log anterior e atual para fazer uma compara��o
#Se a quantidade de linhas total atualmente for maior que a quantidade de linhas do momento de escrita do primeiro log, significa que N�O h� ociosidade.

#FUN��O: teste_ociosidade
teste_ociosidade()
{

#Pega o log de um estado anterior para usar em um teste com o log do estado atual.
log_anterior=$( cat log_anterior.log )


#Pega o log do estado atual do mouse e teclado para comparar com um log do estado anterior. Se for igual, significa que H� ociosidade.
log_atual=$( cat mouse.log teclado.log | wc -l )


#Teste para verificar se o usu�rio est� ocioso, se o n�mero de log � igual ao log anterior.

if [ "$log_anterior" -eq "$log_atual" ]
then
sleep 5
echo "5" >> tempo_ocioso.log
else
sleep 5
echo $log_atual > log_anterior.log
echo > tempo_ocioso.log
fi
}

                              ######################################################################
                              ###Teste para saber se o tempo ocioso atingiu o limite estabelecido###
                              ######################################################################


##############################################################################################################################
######################################### ATEN��O ATEN��O ATENC�O ATEN��O ATEN��O ############################################
##############################################################################################################################

#Aqui existem alguns valores de "ociosidade" pr� estabelecidos, deixe descomentada apenas a linha que se refere ao valor desejado.

echo 2 minutos = 555555555555555555555555 > tempo_limite.log
#echo 3 minutos = 555555555555555555555555555555555555 > tempo_limite.log
#echo 4 minutos = 555555555555555555555555555555555555555555555555 > tempo_limite.log
#echo 5 minutos = 555555555555555555555555555555555555555555555555555555555555 > tempo_limite.log
#echo 6 minutos = 555555555555555555555555555555555555555555555555555555555555555555555555 > tempo_limite.log
#echo 7 minutos = 555555555555555555555555555555555555555555555555555555555555555555555555555555555555 > tempo_limite.log
#echo 8 minutos = 555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555 > tempo_limite.log
#echo 9 minutos = 555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555 > tempo_limite.log
#echo 10 minutos = 555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555 > tempo_limite.log


#Caso deseje outro valor de ociosidade crie um n�mero composto por caract�res cinco "5" que contenha a quantidade de cincos segundos do tempo desejado.

##############################################################################################################################
##############################################################################################################################

#L� e guarda o tempo de ociosidade estabelecido pelo usu�rio para ativar o protetor de tela.

#Teste para saber se a ociosidade atingiu o valor m�ximo, escolhido pelo usu�rio.

tempo_limite=$( cat tempo_limite.log | awk '{print $4}' )

teste_ociosidade_disparo()
{

#Aqui o sed possui um par�metro para juntar todas as linhas do log de tempo ocioso. Isso � necess�rio pois o log � escrito linha por linha.
tempo_ocioso=$( cat tempo_ocioso.log | sed ':a;$!N;s/\n//;ta;' )


if [ "$tempo_ocioso" = "$tempo_limite" ]
then
echo > tempo_ocioso.log
./salvador_de_tela.sh
else
echo ""
fi

}


#Chama as fun��es do programa e fica atualizando o estado de ociosidade.
#� aqui que o script ficar� o resto do tempo.

while true
do

teste_ociosidade && teste_ociosidade_disparo

done

######################################################################################################################################
######################################################################################################################################
############################################INFORMA��ES INFORMA��ES INFORMA��ES INFORMA��ES INFORMA��ES###############################
######################################################################################################################################
#
#Este script n�o faz uso de "novos" softwares, ou implementa novas tecnologias ao GNU/Linux.
#O que ele faz � apenas fazer uso de ferramentas j� desenvolvidas anteriormente por outros programadores/colaboradores.
#Se voc� encontrar qualquer erro, por favor, verifique se o mesmo n�o est� relacionado aos softwares de terceiros.
#Este escript foi testado no Slackware GNU/Linux vers�o 14 em um desktop e funcionou normalmente.
#Se voc� quiser contactar-me, fique livre para isso.
#Seguem as vers�es dos softwares utilizados originalmente neste script, n�o h� garantias de que o mesmo funcione com outras vers�es.
#As vers�es de software apresentadas aqui n�o se referem aos requisitos para execu��o deste script, servem apenas para confer�ncia.

#rm: rm (GNU coreutils) 8.19
#Copyright (C) 2012 Free Software Foundation, Inc.
#License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.
#Escrito por Paul Rubin, David MacKenzie, Richard M. Stallman
#e Jim Meyering.

#nohup: nohup (GNU coreutils) 8.19
#Copyright (C) 2012 Free Software Foundation, Inc.
#License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.
#Escrito por Jim Meyering.

#cat: cat (GNU coreutils) 8.19
#Copyright (C) 2012 Free Software Foundation, Inc.
#License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.
#Escrito por Torbj�rn Granlund e Richard M. Stallman.

#wc: wc (GNU coreutils) 8.19
#Copyright (C) 2012 Free Software Foundation, Inc.
#License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.
#Escrito por Paul Rubin e David MacKenzie.

#echo: echo (GNU coreutils 8.19
#Copyright (C) 2012 Free Software Foundation, Inc.
#License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.
#Written by Brian Fox and Chet Ramey.


#bash: GNU bash, version 4.2.37(2)-release (i486-slackware-linux-gnu)
#Copyright (C) 2011 Free Software Foundation, Inc.
#License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
#This is free software; you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.

#awk: GNU Awk 3.1.8
#Copyright (C) 1989, 1991-2010 Free Software Foundation.
#This program is free software; you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation; either version 3 of the License, or
#(at your option) any later version.
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#You should have received a copy of the GNU General Public License
#along with this program. If not, see http://www.gnu.org/licenses/.

#Mplayer: MPlayer 1.1-4.7.1 (C) 2000-2012 MPlayer Team

#xinput: xinput version 1.6.0
#XI version on server: 2.2
