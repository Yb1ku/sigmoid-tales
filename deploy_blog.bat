@echo off
cd /d "%~dp0"

echo 🔄 Renderizando el sitio con Quarto...
quarto render

echo 🔃 Haciendo pull para sincronizar con GitHub...
git pull origin main --rebase

echo 📤 Añadiendo cambios a Git...
git add .

set /p COMMIT_MSG=Introduce un mensaje para el commit: 
git commit -m "%COMMIT_MSG%"
git push origin main

echo ✅ Blog publicado con éxito en GitHub Pages (main/docs)
pause
