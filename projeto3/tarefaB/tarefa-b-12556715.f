c     tarefa b
       implicit real*8 (a-h, o-z)
       parameter(a = 0.d0)
       parameter(b = 1.d0)

 11    format(A5, A18, 2A20) 
 12    format(I8, 3e20.11)     
 13    format(A30, e17.11)

       open(10, FILE='saida-b-12556715.dat')
       
       N = 12
       exatos = primitiva(b) - primitiva(a)

       write(10, 11) 'N','R. do Trapézio','R. do Simpson','R. do Boole'
       write(10, *) ' '

       do i = 1, 10
            h = 1.d0/N
            atra = 0.d0
            asim = 0.d0
            aboo = 0.d0
            !fazendo a regra do trapézio junto com a regra de simpson, 
            !por apresentarem o mesmo fn
            do j = 1, N-1, 2
                xi = a + (j * h)
                f0 = f(xi,0,h)
                f1 = f(xi,1,h)
                f1neg = f(xi,-1,h)
                atra = atra + (h/2.d0)*(f1neg + 2*f0 +f1)
                asim = asim + (h/3.d0)*(f1+4 * f0 + f1neg)
            end do
            !fazendo a regra do boole
            do k = 0, N-4, 4
                xi = a + (k*h)
                f0 = f(xi,0,h)
                f1 = f(xi,1,h)
                f2 = f(xi,2,h)
                f3 = f(xi,3,h)
                f4 = f(xi,4,h)
                aboo = aboo +((2*h)/45.d0)*(7.d0*f0+32.d0*f1+
     +          12.d0*f2+32.d0*f3+7.d0*f4) 
            end do

            write(10, 12) N, abs(exatos-atra), 
     +      abs(exatos-asim), abs(exatos-aboo)

            N = 2 * N

       end do

       write(10,*) ' '
       write(10, 13) 'Exatos: ', exatos

       close(10)
       end

       function primitiva(x)
           implicit real*8 (a-h, o-z)
           parameter(pi = dacos(-1.d0))
           primitiva = (4*dexp(x/4.d0)*(dsin(pi*x)-4*pi*dcos(pi*x)))/
     +((16*pi**2)+1)
       return
       end function

       function f(x, n, h)
           implicit real*8 (a-h, o-z)
           parameter(pi = dacos(-1.d0))
           xden = x + n * h
           f = dexp(xden/4.d0)*dsin(pi*xden)
       return
       end function