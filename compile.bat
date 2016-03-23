:: Called from Notepad++ Run  
:: [path_to_bat_file] "$(CURRENT_DIRECTORY)" "$(NAME_PART)"  

:: Change Drive and  to File Directory  
%~d1  
cd %1

:: Run Cleanup  
call:cleanup  

:: Run pdflatex -&gt; bibtex -&gt; pdflatex -&gt; pdflatex  
texify.exe --pdf --engine=xetex --tex-option=synctexoption thesis.tex 


:: Run Cleanup  
call:cleanup  

:: Open PDF  
START  "C:\apps\Sumatra\SumatraPDF.exe" C:\Users\celsius\Desktop\current\thesis.pdf -reuse-instance  

:: Cleanup Function  
:cleanup  
del *.dvi
del *.out
:: del *.log 
:: del *.aux  
:: del *.bbl    
:: del *.blg  
:: del *.brf  

goto:eof  