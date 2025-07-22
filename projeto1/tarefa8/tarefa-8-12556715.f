c     tarefa 8
c     cáculo do volume de uma esfera em d dimensões
      write(*,*) 'Insira, respectivamente, os valores de d e M:'
      read(*,*) id, M

c     geração e testagem dos pontos aleatórios
      dentro = 0
      fora = 0
      do npassos = 1, M
          ponto2 = 0.e0
          do ndim = 1, id
              x = rand(iseed) !para ser "mais aleatório" 
              ponto2 = ponto2 + x**2      
          enddo
          if (sqrt(ponto2) <= 1.e0) then
              dentro = dentro + 1.e0
          else
              fora = fora + 1.e0
          endif
      enddo

c     cálculo do volume
      razao = dentro/(fora + dentro)
      volume = (2.e0**id) * (razao)
      
      write(*,*) 'O volume é', volume

      end