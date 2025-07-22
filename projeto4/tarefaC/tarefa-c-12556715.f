c     tarefa c
      implicit real*8(a-h, o-z)
      parameter(tempo = 30.d0) !tempo total do problema
      parameter(i = 1000) !número de passos
      parameter(g = 9.8d0) !aceleração gravitacional
      parameter(comp = 9.8d0) !comprimento do pêndulo
      parameter(pi = dacos(-1.d0))
      parameter(rm = 1.d0) !massa
      parameter(gamma = 0.5d0)
      parameter(F0 = 1.2d0) !força que vou alternando para os casos
      parameter(omegaF = 2.d0/3.d0)
      parameter(theta01 = 0.221d0)
      parameter(theta02 = 0.222d0)

c     arquivos de saída para graficar
      iout10 = 10 !unidade arquivo de saída
      open(unit=iout10, FILE='saida-c-f12.dat')
    
      omega01 = 0.d0 
      omega02 = 0.d0 
      deltaT = tempo/i !o valor de cada delta t
      deltaTheta = theta02 - theta01 !diferença de ângulos inicial
            
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

      deltaTheta = theta2 - theta1
      
      write(iout10,*) t, dlog(abs(deltaTheta))
      end do

      close(iout10)
    
      end