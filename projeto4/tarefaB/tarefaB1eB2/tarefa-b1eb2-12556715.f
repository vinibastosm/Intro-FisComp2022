c     tarefa b1
      implicit real*8(a-h, o-z)
      parameter(tempo = 100.d0) !tempo total do problema
      parameter(i = 1000) !número de passos
      parameter(g = 9.8d0) !aceleração gravitacional
      parameter(comp = 9.8d0) !comprimento do pêndulo
      parameter(pi = dacos(-1.d0))
      parameter(rm = 1.d0) !massa
      parameter(gamma = 0.d0)
      parameter(F0 = 0.d0)

c     arquivos de saída para graficar
      iout10 = 10 !unidade arquivo de saída
      open(unit=iout10, FILE='saida-b1eb2.dat')
      write(iout10, *) 'Theta0   ', 
     +'                   Busca Direta  ', 
     +'            Integral Elíptica   ', 
     +'      Aproximação ângulos pequenos   '
      
      omega0 = 0.d0 !iniciando a velocidade angular
      deltaT = tempo/i !o valor de cada delta t
      theta0 = (5.d0/180.d0)*pi !5 graus em radianos
      
      do k = 1, 15
c     Busca direta do Período
c     Método de Euler-Cromer
      omega = omega0
      theta = theta0
      Tdireto = 0.d0
      n = 0
      do while (Tdireto == 0.d0) 
        do j = 1, i
        !cálculo do omega
        t = j*deltaT
        omega = omega - (g/comp)*dsin(theta)*deltaT - gamma*omega*delt
     +aT +F0*deltaT*dsin(omegaF*t) 
        !cálculo do theta
        theta1 = theta !para comparar
        theta = theta + deltaT*omega
        if (theta1 * theta < 0) then
              n = n + 1
              if (n == 1) then
                    Tesq = t
              else if (n == 3) then
                    Tdireto = t - Tesq
              end if
        end if 
        end do
      end do 

c     Integral elíptica - Regra de Boole
      h = theta0/i
      eps = 1.d-7 !arbitrário
      Tint = 0.d0
      do j = 1, (i/4)-1
          x0 = -theta0 + 4.d0*j*h + eps
          Tint = Tint + 7.d0*f(x0-4.d0*h, theta0) + 32.d0*f(x0-3.d0*h,
     +theta0) + 12.d0*f(x0-2.d0*h, theta0) + 32.d0*f(x0-1.d0*h, theta0)
     ++ 7.d0*f(x0, theta0)
      end do
      Tint = Tint * ((2.d0*h)/45.d0)
      Tint = Tint + 2.d0*dsqrt((2.d0*comp*eps)/(g*dsin(theta0)))

c     Aproximação de ângulos pequenos
      Tpeq = 2.d0 * pi * dsqrt(comp/g) * (1.d0 + ((theta0**2)/16))

      write(iout10,*) theta0, Tdireto, Tint, Tpeq 

      theta0 = theta0 + (5.d0/180.d0)*pi !vou de 5 em 5 graus
      end do 
      
      close(iout10)
      
      end

      function f(x, theta0)
            implicit real*8(a-h, o-z)
            f = 1.d0/dsqrt(dcos(x) - dcos(theta0))
      return
      end function 