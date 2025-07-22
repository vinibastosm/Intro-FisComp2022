c     tarefa 3

      parameter(n = 50)
      dimension rLista(n)

      in = 10 !unidade arquivo entrada
      iout = 11 !unidade arquivo saída

      open(unit=in, FILE='entrada_t3.dat')
      open(unit=iout, FILE='saida_t3.dat')

c     escolha do usuário da qtde de números a serem ordenados
      write(*,*) 'Escolha a quantidade M (menor ou igual a 50) de núme
     +ros a serem ordenados:'
      read(*,*) M
      
c     faz a leitura do arquivo de entrada
      read(in,*) rLista

c     bubble sort
      do i = 1, M   
         do j = M, 2, -1
                if (rLista(j)<rLista(j-1)) then
                        termo = rLista(j)
                        rLista(j) = rLista(j-1)
                        rLista(j-1) = termo
                 end if
         enddo
      enddo

c     salvando no arquivo de saída
      do i = 1, M
          write(iout,*) rLista(i)
      end do

c     escrevendo para o usuário
      do i = 1, M
          write(*,*) rLista(i)
      end do

c     fechando os arquivos
      close(in)
      close(iout)

      end
