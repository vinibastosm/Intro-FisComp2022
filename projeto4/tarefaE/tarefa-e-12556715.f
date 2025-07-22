c     tarefa e
      implicit real*8(a-h, o-z)
      parameter(tempo = 100.d0) !tempo total do problema
      parameter(i = 1000) !número de passos
      parameter(g = 9.8d0) !aceleração gravitacional
      parameter(comp = 9.8d0) !comprimento do pêndulo
      parameter(pi = dacos(-1.d0))
      parameter(rm = 1.d0) !massa
      parameter(gamma = 0.5d0)
      parameter(F0 = 1.2d0) !força que vou alternando para os casos
      parameter(omegaF = 2.d0/3.d0)
      parameter(theta01 = 1.2d0)
      parameter(theta02 = 2.4d0)

c     arquivos de saída para graficar
      iout10 = 10 !unidade arquivo de saída
      open(unit=iout10, FILE='saida-e-f12-p1.dat')
      iout11 = 11 !unidade arquivo de saída
      open(unit=iout11, FILE='saida-e-f12-p2.dat')
    
      omega01 = 0.d0 
      omega02 = 0.d0 
      deltaT = tempo/i !o valor de cada delta t
            
c     Método de Euler-Cromer
      omega1 = omega01
      omega2 = omega02
      theta1 = theta01
      theta2 = theta02
      do j = 1, i
      !cálculo do omega
      t = j*deltaT
      omega1 = omega1 - (g/comp)*dsin(theta1)*deltaT - gamma*omega1*del
     +taT +F0*deltaT*dsin(omegaF*t) 
      omega2 = omega2 - (g/comp)*dsin(theta2)*deltaT - gamma*omega2*del
     +taT +F0*deltaT*dsin(omegaF*t)
      !cálculo do theta
      theta1 = theta1 + deltaT*omega1
      theta2 = theta2 + deltaT*omega2
      theta1 = mod(theta, 2*pi)
      theta2 = mod(theta, 2*pi)
      
      if (mod(omegaF*t, pi) .lt. 0.000000001) then
          write(iout10,*) theta1, omega1
          write(iout11,*) theta2, omega2
      end if
      
      end do

      close(iout10)
      close(iout11)

      end