c     teste 6
c     definindo os parâmetros para a matriz permutação
      parameter(ncolunas = 4) !o fortran lê de maneira que tranpõe a
                             !matriz usada 
      parameter(nlinhas = 6) !N = 3 -> nlinhas = N+1 = 4
      parameter(N = 3)
      dimension iMatriz_t(ncolunas,nlinhas)
      dimension iP(nlinhas,ncolunas)
      dimension matrizT(N,N)
      dimension matriz(N,N)
    
      in = 10 
      in2 = 11

c     abertura e leitura da entrada
      open(unit=in, FILE='permutacao-t6.dat')
      open(unit=in2, FILE='matriz.dat')
      read(in,*) iMatriz_t
      read(in2,*) matrizT
      iP = transpose(iMatriz_t) !matriz desejada é a transposta da lida
      matriz = transpose(matrizT)

c     cálculo do determinante a partir do arquivo 'permutacao-t6.dat'
c     obtido a partir do programa da tarefa 5

      det = 0.e0
      do i=1,nlinhas
         termo = 1.e0
        do j=1, N
         termo = termo * matriz(j,iP(i,j))
        end do
         termo = termo * iP(i, N+1)
         det = det + termo
      end do
      
      write(*,*) 'O determinante da matriz dada é', det

c     fechando os arquivos
      close(in)
      close(in2)
      
      end
