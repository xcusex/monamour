@echo off
setlocal
cd /d "%~dp0"
where py >nul 2>nul
if errorlevel 1 goto python
py -3 -c "import http.server as h,webbrowser; s=h.ThreadingHTTPServer(('127.0.0.1',0),h.SimpleHTTPRequestHandler); url='http://127.0.0.1:'+str(s.server_port)+'/'; print(url,flush=True); webbrowser.open(url); s.serve_forever()"
goto end
:python
where python >nul 2>nul
if errorlevel 1 goto missing
python -c "import http.server as h,webbrowser; s=h.ThreadingHTTPServer(('127.0.0.1',0),h.SimpleHTTPRequestHandler); url='http://127.0.0.1:'+str(s.server_port)+'/'; print(url,flush=True); webbrowser.open(url); s.serve_forever()"
goto end
:missing
echo Install Python 3 to launch the local server.
:end
pause
