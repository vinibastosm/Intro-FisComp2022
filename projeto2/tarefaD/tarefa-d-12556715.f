c     tarefa d

c     constantes, vetores e arquivo de saída
      parameter(M = 10000) !número de andarilhos
      parameter(N = 1000) !número de passos
      dimension ipos(-N:N,-N:N) !matriz que guarda posição
      dimension ipx(M)
      dimension ipy(M)
      open(unit=iout, FILE='saida-d.dat')

c     iniciando a matriz posição
      do i = -N, N, 1
        do j = -N, N, 1
            ipos(i,j) = 0
        enddo
      enddo

c     iniciando os vetores posição
      do i = 1, M
         ipx(i) = 0
         ipy(i) = 0
      enddo

c     cálculo da posição de cada andarilho e soma das médias
      pdir = 1.e0/4.e0 !probabilidade direita
      pesq = 2.e0/4.e0 !probalidade esquerda
      pcima = 3.e0/4.e0 !probalidade cima
      pbaixo = 4.e0/4.e0 !probalidade baixo
      ilado = 10 !lado do micro espaço
      do i = 1, N !tempo
          Stotal = 0.e0
          do j = 1, M !andarilho
              x = rand()
              if (x <= pdir) then
                  ipx(j) = ipx(j) + 1
              else if (pdir < x .and. x <= pesq) then
                  ipx(j) = ipx(j) - 1
              else if (pesq < x .and. x <= pcima) then
                  ipy(j) = ipy(j) + 1
              else if (pcima < x .and. x <= pbaixo) then
                  ipy(j) = ipy(j) - 1 
              endif
              ipos(ipx(j),ipy(j)) = ipos(ipx(j),ipy(j)) + 1
          enddo
          do k = -N, N - ilado, ilado !percorre o eixo x
            icont = 0
            do l = -N, N - ilado, ilado !percorre o eixo y
                do im = k, k+ilado, 1
                    do in = l, l+ilado, 1
                      icont = icont + ipos(im,in)
                    enddo
                enddo
            enddo
            !cálculo da entropia total
            if (icont /= 0) then
              cont = icont !transformando em real
              rM = M !transformando em real
              prob = cont/rM
              S = prob * log(prob)
              Stotal = Stotal - S
            endif
          enddo
          !reiniciando a matriz posição
          do i2 = -N, N, 1
            do j2 = -N, N, 1
              ipos(i2,j2) = 0
            enddo
          enddo
          write(iout,*) i, Stotal
      enddo

c     fechando o arquivo de saída
      close(iout)

      end