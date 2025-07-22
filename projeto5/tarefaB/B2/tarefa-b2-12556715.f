c    tarefa b2
      implicit real*8 (a-h, o-z)
      parameter(pi = dacos(-1.d0))
      parameter(dmter = 1.d0)
      parameter(dmjup = 5.2d0)
      
c     abrindo arquivos de saída
      ioutT = 10
      open(ioutT, FILE='saida-b2-terra100.dat')
      ioutJ = 20
      open(ioutJ, FILE='saida-b2-jupiter100.dat')

      deltaT = (1.d0/365.d0) !um dia em anos
      n = 365 * 30 !tempo de simulação em dias terrestres
      GMs = 4*(pi**2)
      
c     Sol: posição
      xs = 0.d0
      ys = 0.d0

c     Terra: iniciando as variáveis 
      v0xt = 0.d0
      v0yt = (2.d0*pi)/(dsqrt(dmter)) 
      x0t = dmter
      y0t = 0.d0
      
c     Júpiter: iniciando as variáveis 
      v0xj = 0.d0
      v0yj = (2.d0*pi)/(dsqrt(dmjup)) 
      x0j = dmjup
      y0j = 0.d0

c     método de Euler para x1 e y1
      x1t = x0t + v0xt * deltaT
      y1t = y0t + v0yt * deltaT
      write(ioutT,*) x0t, y0t
      write(ioutT,*) x1t, y1t
      x1j = x0j + v0xj * deltaT
      y1j = y0j + v0yj * deltaT
      write(ioutJ,*) x0j, y0j
      write(ioutJ,*) x1j, y1j

c     método de Verlet
      do i = 2, n
          rts = dsqrt((x1t - xs)**2 + (y1t - ys)**2) !dist Terra-Sol
          rtj = dsqrt((x1t - x1j)**2 + (y1t - y1j)**2) !dist Terra-Jup
          rjs = dsqrt((x1j - xs)**2 + (y1j - xs)**2) !dist Jup-Sol
          !Terra:
          Fxter = (-1)*(((GMs*(x1t-xs))/(rts**3)) + ((GMs*(x1t-x1j))/(1
     +0*(rtj**3)))) !x100 e x1000 alterando aqui
          x2t = 2*x1t - x0t + Fxter*(deltaT**2)
          Fyter = (-1)*(((GMs*(y1t-ys))/(rts**3)) + ((GMs*(y1t-y1j))/(1
     +0*(rtj**3)))) !x100 e x1000 alterando aqui
          y2t = 2*y1t - y0t + Fyter*(deltaT**2)
          !Júpiter
          Fxjup = (-1)*(((GMs*(x1j-xs))/(rjs**3)) + ((GMs*(x1j-x1t))/(3
     +.d3*(rtj**3))))
          x2j = 2*x1j - x0j + Fxjup*(deltaT**2)
          Fyjup = (-1)*(((GMs*(y1j-ys))/(rjs**3)) + ((GMs*(y1j-y1t))/(3
     +.d3*(rtj**3))))
          y2j = 2*y1j - y0j + Fyjup*(deltaT**2)

          x0t = x1t
          x1t = x2t
          y0t = y1t
          y1t = y2t
          x0j = x1j
          x1j = x2j
          y0j = y1j
          y1j = y2j

          write(ioutT, *) x2t, y2t
          write(ioutJ, *) x2j, y2j
      end do

      close(ioutT)
      close(ioutJ)

      end