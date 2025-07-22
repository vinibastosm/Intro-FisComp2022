c    tarefa b3
      implicit real*8 (a-h, o-z)
      parameter(pi = dacos(-1.d0))
      parameter(dmjup = 5.2d0)
      parameter(dma1 = 3.d0)
      parameter(dma2 = 3.276d0)
      parameter(dma3 = 3.7d0)
      
c     abrindo arquivos de saída
      ioutA1 = 10
      open(ioutA1, FILE='saida-b3-ast1.dat')
      ioutA2 = 20
      open(ioutA2, FILE='saida-b3-ast2.dat')
      ioutA3 = 30
      open(ioutA3, FILE='saida-b3-ast3.dat')
      ioutJ = 40
      open(ioutJ, FILE='saida-b3-jupiter.dat')

      deltaT = (1.d0/365.d0) !um dia em anos
      n = 365 * 25 !tempo de simulação em dias terrestres
      GMs = 4*(pi**2)

c     Sol: posição
      xs = 0.d0
      ys = 0.d0

c     Asteroides: iniciando as variáveis 
      !Ast1
      v0xa1 = 0.d0
      v0ya1 = 3.628d0
      x0a1 = dma1
      y0a1 = 0.d0
      !Ast2
      v0xa2 = 0.d0
      v0ya2 = 3.471d0
      x0a2 = dma2
      y0a2 = 0.d0
      !Ast3
      v0xa3 = 0.d0
      v0ya3 = 3.267d0
      x0a3 = dma3
      y0a3 = 0.d0
      
c     Júpiter: iniciando as variáveis 
      v0xj = 0.d0
      v0yj = 2.755d0
      x0j = dmjup
      y0j = 0.d0

c     método de Euler para x1 e y1
      x1a1 = x0a1 + v0xa1 * deltaT
      y1a1 = y0a1 + v0ya1 * deltaT
      write(ioutA1,*) x0a1, y0a1
      write(ioutA1,*) x1a1, y1a1
      x1a2 = x0a2 + v0xa2 * deltaT
      y1a2 = y0a2 + v0ya2 * deltaT
      write(ioutA2,*) x0a2, y0a2
      write(ioutA2,*) x1a2, y1a2
      x1a3 = x0a3 + v0xa3 * deltaT
      y1a3 = y0a3 + v0ya3 * deltaT
      write(ioutA3,*) x0a3, y0a3
      write(ioutA3,*) x1a3, y1a3
      x1j = x0j + v0xj * deltaT
      y1j = y0j + v0yj * deltaT
      write(ioutJ,*) x0j, y0j
      write(ioutJ,*) x1j, y1j

c     método de Verlet
      do i = 2, n
          ra1s = dsqrt((x1a1 - xs)**2 + (y1a1 - ys)**2) !dist Ast1-Sol
          ra1j = dsqrt((x1a1 - x1j)**2 + (y1a1 - y1j)**2) !dist Ast1-Jup
          rjs = dsqrt((x1j - xs)**2 + (y1j - xs)**2) !dist Jup-Sol
          ra2s = dsqrt((x1a2 - xs)**2 + (y1a2 - ys)**2) !dist Ast2-Sol
          ra2j = dsqrt((x1a2 - x1j)**2 + (y1a2 - y1j)**2) !dist Ast2-Jup
          ra3s = dsqrt((x1a3 - xs)**2 + (y1a3 - ys)**2) !dist Ast3-Sol
          ra3j = dsqrt((x1a3 - x1j)**2 + (y1a3 - y1j)**2) !dist Ast3-Jup
          !Asteroides:
            !Ast1
          Fxa1 = (-1)*(((GMs*(x1a1-xs))/(ra1s**3)) + ((GMs*(x1a1-x1j))/
     +(10.d3*(ra1j**3))))
          x2a1 = 2*x1a1 - x0a1 + Fxa1*(deltaT**2)
          Fya1 = (-1)*(((GMs*(y1a1-ys))/(ra1s**3)) + ((GMs*(y1a1-y1j))/
     +(10.d3*(ra1j**3))))
          y2a1 = 2*y1a1 - y0a1 + Fya1*(deltaT**2)
            !Ast2
          Fxa2 = (-1)*(((GMs*(x1a2-xs))/(ra2s**3)) + ((GMs*(x1a2-x1j))/
     +(10.d3*(ra2j**3))))
          x2a2 = 2*x1a2 - x0a2 + Fxa2*(deltaT**2)
          Fya2 = (-1)*(((GMs*(y1a2-ys))/(ra2s**3)) + ((GMs*(y1a2-y1j))/
     +(10.d3*(ra2j**3))))
          y2a2 = 2*y1a2 - y0a2 + Fya2*(deltaT**2)
            !Ast1
          Fxa3 = (-1)*(((GMs*(x1a3-xs))/(ra3s**3)) + ((GMs*(x1a3-x1j))/
     +(10.d3*(ra3j**3))))
          x2a3 = 2*x1a3 - x0a3 + Fxa3*(deltaT**2)
          Fya3 = (-1)*(((GMs*(y1a3-ys))/(ra3s**3)) + ((GMs*(y1a3-y1j))/
     +(10.d3*(ra3j**3))))
          y2a3 = 2*y1a3 - y0a3 + Fya3*(deltaT**2)
          !Júpiter
          Fxjup = (-1)*(((GMs*(x1j-xs))/(rjs**3)))
          x2j = 2*x1j - x0j + Fxjup*(deltaT**2)
          Fyjup = (-1)*(((GMs*(y1j-ys))/(rjs**3)))
          y2j = 2*y1j - y0j + Fyjup*(deltaT**2)

          x0a1 = x1a1
          x1a1 = x2a1
          y0a1 = y1a1
          y1a1 = y2a1

          x0a2 = x1a2
          x1a2 = x2a2
          y0a2 = y1a2
          y1a2 = y2a2

          x0a3 = x1a3
          x1a3 = x2a3
          y0a3 = y1a3
          y1a3 = y2a3
          
          x0j = x1j
          x1j = x2j
          y0j = y1j
          y1j = y2j

          write(ioutA1, *) x2a1, y2a1
          write(ioutA2, *) x2a2, y2a2
          write(ioutA3, *) x2a3, y2a3
          write(ioutJ, *) x2j, y2j
      end do

      close(ioutA1)
      close(ioutA2)
      close(ioutA3)
      close(ioutJ)

      end