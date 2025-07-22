c     tarefa a
      implicit real*8 (a-h, o-z)
      parameter(pi = dacos(-1.d0))
      parameter(dmedia = 1.d0) !distância média que vou alterando em cada caso
      
c     abrindo arquivo de saída
      iout = 10
      open(iout, FILE='saida-a-certa.dat')

      deltaT = (1.d0/365.d0) !um dia em anos
      GMs = 4 * (pi**2) !em unidades astronômicas
      v0x = 0.d0
      v0y = (2.d0*pi)/(dsqrt(dmedia)) 
      x0 = dmedia
      y0 = 0.d0
      n = 365 * 3 !tempo de simulação em dias terrestres

c     método de Euler para x1 e y1
      x1 = x0 + v0x * deltaT
      y1 = y0 + v0y * deltaT
      write(iout,*) x0, y0
      write(iout,*) x1, y1

c     método de Verlet
      do i = 2, n
          r = dsqrt(x1**2 + y1**2)
          !na componente x
          Fx = ((-1)*GMs*x1)/(r**3)
          x2 = 2*x1 - x0 + Fx*(deltaT**2)
          x0 = x1
          x1 = x2
          !na componente y
          Fy = ((-1)*GMs*y1)/(r**3)
          y2 = 2*y1 - y0 + Fy*(deltaT**2)
          y0 = y1
          y1 = y2

          write(iout, *) x2, y2
      end do

      close(iout)

      end