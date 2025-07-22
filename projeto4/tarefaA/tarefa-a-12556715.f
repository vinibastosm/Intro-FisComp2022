c     tarefa a
      implicit real*8(a-h, o-z)
      parameter(tempo = 100.d0) !tempo total do problema
      parameter(i = 1000) !número de passos
      parameter(g = 9.8d0) !aceleração gravitacional
      parameter(comp = 9.8d0) !comprimento do pêndulo
      parameter(pi = dacos(-1.d0))
      parameter(rm = 1.d0) !massa

c     arquivos de saída para graficar
      iout10 = 10 !unidade arquivo de saída
      iout11 = 11 !unidade arquivo de saída
      open(unit=iout10, FILE='saida-a-thetaeuler.dat')
      open(unit=iout11, FILE='saida-a-energiaeuler.dat')
      iout20 = 20 !unidade arquivo de saída
      iout21 = 21 !unidade arquivo de saída
      open(unit=iout20, FILE='saida-a-thetaeulercromer.dat')
      open(unit=iout21, FILE='saida-a-energiaeulercromer.dat')
      
      omega0 = 0.d0 !iniciando a velocidade angular
      deltaT = tempo/i !o valor de cada delta t
      theta0 = (15.d0/180.d0)*pi !15 graus em radianos
      
c     Método de Euler
      omega = omega0
      theta = theta0
      E = 0.d0
      do j = 1, i
      !cálculo da energia total
      E = rm*g*comp*(1.d0 - dcos(theta))+(0.5d0)*rm*(comp*omega)**2
      !cálculo do omega
      omega = omega - (g/comp)*theta*deltaT 
      !cálculo do theta
      theta = theta + deltaT*(omega + (g/comp)*theta*deltaT)
      write(iout10,*) j*deltaT, mod(theta, 2*pi)
      write(iout11,*) j*deltaT, E
      end do
            
c     Método de Euler-Cromer
      omega = omega0
      theta = theta0
      E = 0.d0
      do j = 1, i
      !cálculo da energia total
      E = rm*g*comp*(1.d0 - dcos(theta))+(0.5d0)*rm*(comp*omega)**2
      !cálculo do omega
      omega = omega - (g/comp)*theta*deltaT 
      !cálculo do theta
      theta = theta + deltaT*omega
      write(iout20,*) j*deltaT, mod(theta, 2*pi)
      write(iout21,*) j*deltaT, E
      end do

      close(iout10)
      close(iout11)
      close(iout20)
      close(iout21)
    
      end