c     tarefa c
      implicit real*8(a-h, o-z)
      parameter(eprec = 1d-6)
      parameter (a = -10.d0)
      parameter(b = 10.d0)
      parameter(h = 0.1d0)
       
      open(10, FILE='saida-c-12556715.dat')
 11   format(A20, f20.11, /)

c     Método de busca direta
      write(10, *) '-> Busca direta:'
      write(10, *) ' '
      N = (b-a)/h

      do n = 0, N-1
        x1 = a + (n*h)
        x2 = x1 + h
        if (f(x1) * f(x2) .lt. 0) then
               i = 0
 20        if (abs(f(x1)-f(x2)) .gt. eprec) then
                xm = (x1+x2)/2.d0
               if (f(x2)*f(xm) .gt. 0) then
                    x2 = xm
               else 
                    x1 = xm
               end if
           i = i+1
           write(10, *) i, xm
           goto 20
           end if
           write(10, 11) 'Raiz: ', xm
        end if
      end do

c     Método de Newton Raphson
      write(10, *) '-> Newton-Raphson:'
      x = a
      hden = 1.d0
      raizult = 0.d0
      numraiz = 0
30    if (numraiz < 3) then
           i = 0
           xanterior = x        
40        if (abs(f(x)) > eprec) then
               x = x - (f(x)/d(x))
               i = i+1
               write(10,*) i, x
               goto 40
          end if
          if (abs(x-raizult) > eprec .or. numraiz .eq. 0) then
              write(10, *) 'Raiz: ', x
              numraiz = numraiz+1
              raizult = x
              xanterior = raizult
          end if
          x = xanterior + hden
          goto 30
       end if

c      Método da Secante
       write(*, *) '-> Secante:'
      x = a
      x2 = -2
      hden = 1.d0
      raizult = 0.d0
      numraiz = 0

50    if (numraiz < 3) then
          i = 0
          xanterior = x
60        if (abs(f(x)) > eprec) then
               x1 = x - (f(x)*(x-x2)/(f(x)-f(x2)))
               write(*,*) i, x1
               x2 = x
               x = x1
               i = i + 1
               goto 60
          end if
          if (abs(x-raizult) > eprec .OR. numraiz .EQ. 0) then
              write(*, *) 'Raiz: ', x
              numraiz = numraiz + 1
              raizult = x
              xanterior = raizult
          end if
          x = xanterior + (2 * hden)
          x2 = x - hden
          goto 50
       end if
    
       end

c     função da nossa análise
      function f(a)
          implicit real*8(a-h, o-z)
          f = a**3.d0 - (3.d0/2.d0)*(a**2.d0 + a) + 1.d0
      return
      end function f
c     derivada da função acima
       function d(a)
           implicit real*8(a-h,o-z)
           d = 3*(a**2) - 3*a - (1.5d0)
       return
       end function d