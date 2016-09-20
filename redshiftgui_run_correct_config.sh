 #!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Criticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Este programa é um software livre; você pode redistribui-lo e/ou
# modifica-lo dentro dos termos da Licença Pública Geral GNU como
# publicada pela Fundação do Software Livre (FSF); na versão 2 da
# Licença, ou (na sua opinião) qualquer versão.
#
# Este programa é distribuído na esperança que possa ser útil,
# mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a
# qualquer MERCADO ou APLICAÇÃO EM PARTICULAR.
#
# Veja a Licença Pública Geral GNU para mais detalhes.
# Você deve ter recebido uma cópia da Licença Pública Geral GNU
# junto com este programa, se não, escreva para a Fundação do Software
#
# Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
#
# Script: para a execução do aplicativo redshiftgui (https://github.com/maoserr/redshiftgui)
# e ao terminar corrigir o erro de escrita no arquivos de configuração (~/.redshiftgrc)
#
# Última atualização: 29/04/2016
#
# Dica: Substituir no atalho do aplicativo para executar em vez de redshiftgui
#
/usr/bin/redshiftgui
sed -i "s/|/,/g" ~/.redshiftgrc
