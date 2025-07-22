c     tarefa 1
      write(*,*) 'Insira os valores dos raios r_i e r_e, nesta ordem.'
      read(*,*) r1, r2
      pi = acos(-1.e0)
      area = 2.e0*pi*r2*(2.e0*pi*r1)
      write(*,*) 'A área do torus é', area
      volume = 2.e0*pi*r2*pi*r1*r1
      write(*,*) 'O volume do torus é', volume
      end
