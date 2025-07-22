c     tarefa 4      
c     função para fatorial de um número 

      function fat(i)
      fat = 1
      do 1 j = 1, i
      fat = fat * j
1     continue  
      return
      end function fat  

      real*8 dx !para usar no dcos

c     entrada de dados    
      
      eprec = 1.e-5
      write(*,*) 'Insira o valor de x em radianos:'
      read(*,*) x 
      dx = x

c     cálculo do cosseno com a precisão eprec      
      
      ifator = 2
      ipot = 1
      termo = 1.e0 !iniciando com um número qualquer maior que eprec
      cosseno = 1.e0

      do while(abs(termo) > eprec)
          termo = ((-1)**ipot)*((x**ifator)/(fat(ifator)))
          ifator = ifator + 2
          ipot = ipot + 1
          cosseno = cosseno + termo  
      enddo          
 
      write(*,*) 'O cosseno implementado de x é', cosseno
      write(*,*) 'O cosseno do f77 é', cos(x)
      write(*,*) 'O cosseno com dupla precisão do f77 é', dcos(dx)
      
      end
