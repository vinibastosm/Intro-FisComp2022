c     tarefa A   

      function rmedia(nexp,k)
      rm = 0.e0
      do npassos = 1, k 
         x = rand()
         rm = rm + x**nexp
      enddo 
      rN = k
      rmedia = rm/rN
      return
      end function rmedia

      write(*,*) 'Informe o valor de N:'
      read(*,*) N

      write(*,*) '<x> =', rmedia(1,N)
      write(*,*) '<x**2> =', rmedia(2,N)      
      write(*,*) '<x**3> =', rmedia(3,N)
      write(*,*) '<x**4> =', rmedia(4,N)

      end