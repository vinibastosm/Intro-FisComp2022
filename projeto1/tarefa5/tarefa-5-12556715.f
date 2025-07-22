c     tarefa 5

c     definindo os parâmetros da lista e os arquivo de entrada      
      parameter(ncolunas = 3) !o fortran lê de maneira que tranpõe a
                             !matriz usada 
      parameter(nlinhas = 2)
      dimension iMatriz_t(ncolunas,nlinhas)
      dimension iMatriz(nlinhas,ncolunas)
      dimension iMatriz_gerada(nlinhas*ncolunas, ncolunas+1)

      in = 10 !unidade arquivo entrada
      iout = 11 !unidade arquivo saída

c     abertura e leitura da entrada
      open(unit=in, FILE='entrada_t5.dat')
      open(unit=iout, FILE='saida_t5.dat')
      read(in,*) iMatriz_t

      iMatriz = transpose(iMatriz_t) !matriz desejada é a transposta da lida
      
      kcontaC = ncolunas + 1
      ncontaL = nlinhas * ncolunas
      
c     as primeiras nlinhas serão iguais a do input com o n+1  
      do nl = 1,nlinhas
          nc = 1
          do while(nc < ncolunas)
          iMatriz_gerada(nl,ncolunas) = ncolunas
          iMatriz_gerada(nl,ncolunas+1) = iMatriz(nl,ncolunas)
          iMatriz_gerada(nl,nc) = iMatriz(nl,nc)
          nc = nc + 1
          enddo
      enddo

c     o restante como cópias das primeiras nlinhas
      kc = 1
      do nl = nlinhas + 1, ncontaL
          do kcol = kcontaC, 1, -1
              nl_ant = nlinhas * kc
              iMatriz_gerada(nl, kcol) = iMatriz_gerada(nl-nl_ant,kcol)
          enddo
          if (nl - ((nl/nlinhas)*nlinhas)==0) then
          kc = kc + 1
          end if
      enddo
      
c     permutando
      icontador = 1          
      do nl = nlinhas+1, ncontaL
          k = 1
          do i = 1, icontador  
          iaux = iMatriz_gerada(nl,kcontaC-k-1)  
          iMatriz_gerada(nl,kcontaC-k-1) = iMatriz_gerada(nl,
     +                                             kcontaC-k)
          iMatriz_gerada(nl,kcontaC-k) = iaux 
          iMatriz_gerada(nl, kcontaC) =((-1)**k)*
     +                                 iMatriz_gerada(nl,kcontaC)
          k = k + 1
          enddo
          if (nl - ((nl/nlinhas)*nlinhas)==0) then
            icontador = icontador + 1
          end if
      enddo


c     imprimindo resultados e colocando no arquivo de saída
      do i = 1, ncontaL
          write(*,*) (iMatriz_gerada(i,j), j=1,kcontaC)
          write(iout,*) (iMatriz_gerada(i,j), j=1,kcontaC)
      enddo

c     fechando os arquivos
      close(in)
      close(iout)

      end