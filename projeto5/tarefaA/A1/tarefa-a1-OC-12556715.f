c     tarefa a1 - velocidade de órbita circular
      implicit real*8 (a-h, o-z)
      parameter(pi = dacos(-1.d0))
      dimension dist(9) !quantidade de planetas
      parameter (dist = (/0.39d0, 0.72d0, 1.d0, 1.52d0, 5.2d0, 9.24d0, 
     +19.19d0, 30.06d0, 39.53d0/))
      
c     abrindo arquivo de saida 
      iout = 10
      open(iout, FILE='saida-a1-orbita-circular.dat')

      write(iout,*)'       a                          ','b           
     +       ','excentricidade                ','v0y                 
     +  ','v0y esperado' 

      do in = 1, 9

      v0y = 0.d0
      do ivel = 1, 20
      v0y = v0y + ivel*(2.d0*pi/(10*dsqrt(dist(in))))

      deltaT = (1.d0/365.d0) !um dia em anos
      GMs = 4 * (pi**2) !em unidades astronômicas
      v0x = 0.d0
      x0 = dist(in)
      y0 = 0.d0
      n = 365 * 1000 !tempo de simulação em dias terrestres

c     método de Euler para x1 e y1
      x1 = x0 + v0x * deltaT
      y1 = y0 + v0y * deltaT

c     método de Verlet
      j = 0
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
          !Cálculo do período 
          if (mod(j,2)== 0 .and. dabs(x2).LE.dist(in) .and. x2.LT.0 .an
     +d. y1*y2.LE.0) then
                j = j + 1
                b = x2
          else if (mod(j,2).NE.0 .and. y1*y2.LE.0) then
                j = j + 1
          end if 
          if (j == 2) then
                a = dist(in)
                exc = (dsqrt(a**2 - b**2))/a 
                if (exc .LT. 0.1) then
                  write(iout,*) dist(in), b, exc, v0y, (2.d0*pi/(dsqrt(
     +dist(in))))
                  go to 20
                end if
          end if

          y0 = y1
          y1 = y2
          
      end do

      end do
20    continue
      end do

      close(iout)

      end