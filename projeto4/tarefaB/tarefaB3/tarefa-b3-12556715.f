c     tarefa b3
      implicit real*8(a-h, o-z)
      parameter(tempo = 100.d0) !tempo total do problema
      parameter(i = 1000) !número de passos
      parameter(g = 9.8d0) !aceleração gravitacional
      parameter(comp = 9.8d0) !comprimento do pêndulo
      parameter(pi = dacos(-1.d0))
      parameter(rm = 1.d0) !massa
      parameter(gamma = 0.5d0)
      parameter(F0 = 0.d0)

c     arquivos de saída para graficar
      iout10 = 10 !unidade arquivo de saída
      open(unit=iout10, FILE='saida-b3.dat')
      
      omega0 = 0.d0 !iniciando a velocidade angular
      deltaT = tempo/i !o valor de cada delta t
      theta0 = (15.d0/180.d0)*pi !15 graus em radianos
            
c     Método de Euler-Cromer
      omega = omega0
      theta = theta0
      do j = 1, i
      !cálculo do omega
      t = j*deltaT
      omega = omega - (g/comp)*dsin(theta)*deltaT - gamma*omega*delt
     +aT +F0*deltaT*dsin(omegaF*t) 
      !cálculo do theta
      theta = theta + deltaT*omega
      write(iout10,*) t, theta
      end do

      close(iout10)
    
      end