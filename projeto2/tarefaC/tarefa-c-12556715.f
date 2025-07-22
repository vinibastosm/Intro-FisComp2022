c     tarefa c

c     função distância
      function dist(ix, iy)
          vx = ix
          vy = iy
          dist = sqrt(vx**2 + vy**2)
      return
      end function dist

c     criando um vetor para guardar as informações
      dimension saida(100000) !M = número de andarilhos

c     arquivo de saída para graficar
      iout = 10 !unidade arquivo de saída
      open(unit=iout, FILE='saida-c.dat')

c     cálculo da posição de cada andarilho e soma das médias
      M = 100000
      N = 100 !número de passos (que vou ir mudando)
      pdir = 1.e0/4.e0 !probabilidade direita
      pesq = 2.e0/4.e0 !probalidade esquerda
      pcima = 3.e0/4.e0 !probalidade cima
      pbaixo = 4.e0/4.e0 !probalidade baixo
      soma1 = 0.e0
      soma2 = 0.e0
      do i = 1, M
          ipx = 0
          ipy = 0
          do j = 1, N
              x = rand()
              if (x <= pdir) then
                  ipx = ipx + 1
              else if (pdir < x .and. x <= pesq) then
                  ipx = ipx - 1
              else if (pesq < x .and. x <= pcima) then
                  ipy = ipy + 1
              else if (pcima < x .and. x <= pbaixo) then
                  ipy = ipy - 1 
              endif
          enddo
          write(iout,*) ipx, ipy
          d = dist(ipx, ipy)
          saida(i) = d
          soma1 = soma1 + d
          soma2 = soma2 + d**2
      enddo

c     cálculo das médias
      write(*,*) 'Para N =', N
      write(*,*) '<r> =', soma1/M
      write(*,*) '<Δ²> =', (soma2/M - (soma1/M)**2)

c     fechando o arquivo
      close(iout)   
  
      end