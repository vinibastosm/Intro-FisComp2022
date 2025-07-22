c     tarefa 9
c     função que calcula a função gamma      
      function fgamma(x)
      pi = acos(-1.e0)
      fator = 1.e0
      do while((abs(x - 0.5) > 0.0001).and.(abs(x - 1.e0) > 0.0001)) 
        x = x - 1.e0
        fator = fator * x
      enddo
      if (abs(x - 0.5) <= 0.0001) then 
        fgamma = sqrt(pi) * fator
      else if (abs(x - 1.e0) <= 0.0001) then
           fgamma = 1.e0 * fator
      end if
      return
      end function fgamma 

c     arquivo de saída     
      parameter(nlinhas = 20)
      parameter(ncolunas = 2)
      dimension saida(nlinhas, ncolunas)

      iout = 10
      open(unit=iout,FILE='dimensões-esferas.dat') 
      
      write(*,*) '     Dimensão    Volume'
      do id = 1, 20
          d = id 
          y = (d/2.e0) + 1.e0
          pi = acos(-1.e0)
          R = 1 !raio unitário

          volume = ((pi**(d/2.e0)*(R**d))/fgamma(y))
          saida(id, 1) = d
          saida(id, 2) = volume
          write(*,*)id, volume
      enddo 

c     imprimindo resultados e colocando no arquivo de saída
      do i = 1, nlinhas
          write(iout,*) (saida(i,j), j=1,ncolunas)
      enddo  

      close(iout) !fechando o arquivo de saída
      
      end