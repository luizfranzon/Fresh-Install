# Fresh Install - Step by Step

### Oh-My-Posh
1- Após instalado, crie o arquivo de configuração do perfil:
```powershell
New-Item -Path $PROFILE -Type File -Force
```

2- Cole o comando para carregar o tema:
```powershell
oh-my-posh init pwsh --config ~/powershell_spaceship.json | Invoke-Expression
```

3- Carregar arquivo de configuração sem ter que fechar e abrir :P
```powershell
. $PROFILE
```

<hr>
