c     tarefa a
c     declarando variáveis de dupla precisão
      real*8 x, vh, df2, dt2, ds3, ds5, d2s, d3as, f, d1, d2, d3
      parameter(x = 0.5d0)
      dimension vh(14) !são os valores de h necessários em um vetor
      parameter(vh = (/5.d-1, 2.d-1, 1.d-1, 5.d-2, 1.d-2, 5.d-3, 1.d-3,
     +5.d-4, 1.d-4, 5.d-5, 1.d-5, 1.d-6, 1.d-7, 1.d-8/)) 
c     abrindo o arquivo de saída:
      iout = 10
      open(unit=iout, FILE='saida-a-12556715.dat')

      do i = 1, 14
          !derivada simétrica 3ptos:
            ds3 = (f(x+vh(i)) - f(x-vh(i)))/(2.d0*vh(i))
          !derivada para frente 2 ptos:
            df2 = (f(x+vh(i)) - f(x))/vh(i)
          !derivada para tras 2 ptos:
            dt2 = (f(x) - f(x-vh(i)))/vh(i) 
          !derivada simétrica 5 ptos:
            ds5 = (f(x-2.d0*vh(i)) - 8.d0*f(x-vh(i)) + 8.d0*f(x+vh(i))   
     +- f(x+2.d0*vh(i)))/(12.d0*vh(i))
          !derivada segunda simétrica 5 ptos:
            d2s = (-f(x-2.d0*vh(i)) +16.d0*f(x-vh(i)) +16.d0*f(x+vh(i))  
     +- 30.d0*f(x) -f(x+2.d0*vh(i)))/(12.d0*(vh(i)**2.d0))
          !derivada terceira anti-simétrica 5 ptos:
            d3as = (-f(x-2.d0*vh(i)) +2.d0*f(x-vh(i)) -2.d0*f(x+vh(i))  
     ++f(x+2.d0*vh(i)))/(2.d0*(vh(i)**3.d0))
          !escrevendo no arquivo de saída
          write(iout,3) 
3         format(169('-'), /, '|', 6(27x, '|'), /, 169('-'))
          write(iout,4) ds3, df2, dt2, ds5, d2s, d3as 
4         format('| ', 6(d25.18,' | '))        
      end do
      
      write(iout,5)
5       format(169('-')) 

      close(iout) !fechando arquivo de saída

      write(*,*) 'Exatos:'
      write(*,*) '1ª ordem:', d1(0.5d0)
      write(*,*) '2ª ordem:', d2(0.5d0)
      write(*,*) '3ª ordem:', d3(0.5d0)

      end

c     função da nossa análise
      function f(a)
        implicit real*8 (a-h, o-z)
          f = dcosh(3.d0*a)*dsin(a/2.d0)
      return
      end function f 
c     derivada primeira da função da nossa análise
      function d1(a)
        implicit real*8 (a-h, o-z)
          d1 = 3.d0*dsin(a/2.d0)*dsinh(3.d0*a) + (1.d0/2.d0)*(dcos(a/2.
     +d0)*dcosh(3.d0*a))
      return
      end function d1 
c     derivada segunda da função da nossa análise
      function d2(a)
        implicit real*8 (a-h, o-z)
          d2 = 3.d0*dcos(a/2.d0)*dsinh(3.d0*a) + (35.d0/4.d0)*(dsin(a/2
     +.d0)*dcosh(3.d0*a))
      return
      end function d2
c     derivada terceira da função da nossa análise
      function d3(a)
        implicit real*8 (a-h, o-z)
          d3 = (99.d0/4.d0)*(dsin(a/2.d0)*dsinh(3.d0*a)) + (107.d0/8.d0
     +)*(dcos(a/2.d0)*dcosh(3.d0*a))
      return
      end function d3