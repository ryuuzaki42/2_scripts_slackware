#!/bin/bash

#Carlos Eduardo S.M
#14/01/2016
#Rio de Janeiro RJ - Brasil
#Contato: carlinhosedubr@gmail.com
#Script/Programa protetor de tela BRHueHue Screensaver


#Aqui voc� coloca o caminho do arquivo de v�deo que quer que seja reproduzido ao "salvar a tela".
#O Mplayer recebe o par�metro -fs para abrir em tela cheia, o -loop 0 para ficar em loop infinito e -x -y para setar a resolu��o do teu monitor.
#Configure-o de acordo com a necessidade.
#Digite "mplayer --help" ou "man mplayer" sem aspas para mais op��es o para ajuda.

mplayer -fs -loop 0 -x 1280 -y 1024 teu_arquivo_de_video_aqui