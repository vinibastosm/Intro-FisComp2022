c     tarefa b1

c     criando um vetor para guardar as informações
      dimension isaida(100000) !M = número de andarilhos

c     arquivo de saída para graficar
      iout = 10 !unidade arquivo de saída
      open(unit=iout, FILE='saida-b1.dat')

c     cálculo da posição de cada andarilho e soma das médias
      M = 100000
      N = 1000 !número de passos
      p = 0.5e0 !probabilidade direita
      soma1 = 0.e0
      soma2 = 0.e0
      do i = 1, M
          ipx = 0
          do j = 1, N
              x = rand()
              if (x <= p) then
                  ipx = ipx + 1
              else
                  ipx = ipx - 1
              endif
          enddo
          isaida(i) = ipx
          soma1 = soma1 + ipx
          soma2 = soma2 + ipx**2 
      enddo

c     transformando o vetor no arquivo a ser plotado
      min = isaida(1)
      max = isaida(1)
      do i = 1, M
          if (isaida(i) < min) then
            min = isaida(i)
          endif
          if (isaida(i) > max) then
            max = isaida(i)
          endif  
      enddo

      iamplitude = max - min
      njanelas = 14 !vão ser njanelas + 1
      np = iamplitude / njanelas
      np_atual = min - np
      icount = 0
      
      do while(np_atual <= max) 
          np_atual = np_atual + np
          do i = 1, M
              if (isaida(i)<=np_atual .and. isaida(i)>np_atual-np) then
                icount = icount + 1
              endif
          enddo
          write(iout,*) np_atual, icount
          icount = 0 
      enddo

c     cálculo das médias
      write(*,*) 'O número M de andarilhos é', M
      write(*,*) 'As médias são:'
      write(*,*) '<x> =', soma1/M
      write(*,*) '<x**2> =', soma2/M

c     fechando o arquivo de saída
      close(iout)
     
      end