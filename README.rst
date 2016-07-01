.. vi:set fileencoding=utf-8

============================
VM Chromium Caixa com warsaw
============================

[Português logo em seguida]

This VM installs chromium-browser and warsaw from brazilian bank Caixa. The Vagrantfile installs and configure an xenial Ubuntu with salt, configured with openssh-formula, installs xauth and warsaw from Caixa. 

Esta VM instala o chromium (chromium-browser) e o warsaw provido pela Caixa. A intenção é que se use esta VM exclusivamente para o banco Caixa. Assim você não precisa manter um blob binário sendo executado em todo o seu sistema.

.. contents::
    :local:

``Instalação``
--------------

.. code:: bash

    git clone git@github.com:alinefr/vagrant-warsaw.git
    cd vagrant-warsaw
    vagrant up

``Usagem``
----------

Adicione esse alias abaixo no seu ~/.bashrc. Tenha o cuidado de corrigir o diretório onde você clonou o repositório vagrant-warsaw.

.. code:: bash

    alias ubuntu-chromium='cd ~/Projects/vagrant-warsaw && vagrant up && vagrant ssh -c "/usr/local/bin/warsaw/core && chromium-browser" && vagrant halt'
