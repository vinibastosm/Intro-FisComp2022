c    tarefa b3.2
      implicit real*8 (a-h, o-z)
      parameter(pi = dacos(-1.d0))
      parameter(rMs = 2.d30)
      dimension dist(9) !quantidade de planetas
      parameter (dist = (/0.39d0, 0.72d0, 1.d0, 1.52d0, 5.2d0, 9.24d0, 
     +19.19d0, 30.06d0, 39.53d0/))
     dimension rmassa(9) !quantidade de planetas
      parameter (rmassa = (/2.4d23, 4.9d24, 6.d24, 6.6d23, 1.9d27, 
     +5.7d26, 8.8d25, 1.03d26, 6.d24/))


c     abrindo arquivos de saída
      imercurio = 10
      open(imercurio, FILE='saida-mercurio.dat')
      ivenus = 20
      open(ivenus, FILE='saida-venus.dat')
      iterra = 30
      open(iterra, FILE='saida-terra.dat')
      imarte = 40
      open(imarte, FILE='saida-marte.dat')
      ijupiter = 50
      open(ijupiter, FILE='saida-jupiter.dat')
      isaturno = 60
      open(isaturno, FILE='saida-saturno.dat')
      iurano = 70
      open(iurano, FILE='saida-urano.dat')
      inetuno = 80
      open(inetuno, FILE='saida-netuno.dat')
      iplutao = 90
      open(iplutao, FILE='saida-plutao.dat')

      G = (4*(pi**2))/rMs !constante gravitacional em Unidade Astronômicas
      deltaT = (1.d0/365.d0) !um dia em anos
      n = 365 * 300 !tempo de simulação em dias terrestres      
      
c     Sol: posição
      xs = 0.d0
      ys = 0.d0

c     Mercúrio: iniciando as variáveis 
      v0xme = 0.d0
      v0yme = (2.d0*pi)/(dsqrt(dmercurio)) 
      x0me = dmercurio
      y0me = 0.d0
      
c     Vênus: iniciando as variáveis 
      v0xv = 0.d0
      v0yv = (2.d0*pi)/(dsqrt(dvenus)) 
      x0v = dvenus
      y0v = 0.d0

c     Terra: iniciando as variáveis 
      v0xt = 0.d0
      v0yt = (2.d0*pi)/(dsqrt(dterra)) 
      x0t = dterra
      y0t = 0.d0

c     Marte: iniciando as variáveis 
      v0xma = 0.d0
      v0yma = (2.d0*pi)/(dsqrt(dmarte)) 
      x0ma = dmarte
      y0ma = 0.d0
      
c     Júpiter: iniciando as variáveis 
      v0xj = 0.d0
      v0yj = (2.d0*pi)/(dsqrt(djupiter)) 
      x0j = djupiter
      y0j = 0.d0

c     Saturno: iniciando as variáveis 
      v0xs = 0.d0
      v0ys = (2.d0*pi)/(dsqrt(dsaturno)) 
      x0s = dsaturno
      y0s = 0.d0

c     Urano: iniciando as variáveis 
      v0xu = 0.d0
      v0yu = (2.d0*pi)/(dsqrt(durano)) 
      x0u = durano
      y0u = 0.d0

c     Netuno: iniciando as variáveis 
      v0xn = 0.d0
      v0yn = (2.d0*pi)/(dsqrt(dnetuno)) 
      x0n = dnetuno
      y0n = 0.d0

c     Plutão: iniciando as variáveis 
      v0xp = 0.d0
      v0yp = (2.d0*pi)/(dsqrt(dplutao)) 
      x0p = dplutao
      y0p = 0.d0

c     método de Euler para x1 e y1
      !Mercúrio
      x1me = x0me + v0xme * deltaT
      y1me = y0me + v0yme * deltaT
      write(imercurio,*) x0me, y0me
      write(imercurio,*) x1me, y1me
      !Vênus
      x1v = x0v + v0xv * deltaT
      y1v = y0v + v0yv * deltaT
      write(ivenus,*) x0v, y0v
      write(ivenus,*) x1v, y1v
      !Terra
      x1t = x0t + v0xt * deltaT
      y1t = y0t + v0yt * deltaT
      write(iterra,*) x0t, y0t
      write(iterra,*) x1t, y1t
      !Marte
      x1ma = x0ma + v0xma * deltaT
      y1ma = y0ma + v0yma * deltaT
      write(imarte,*) x0ma, y0ma
      write(imarte,*) x1ma, y1ma
      !Júpiter
      x1j = x0j + v0xj * deltaT
      y1j = y0j + v0yj * deltaT
      write(ijupiter,*) x0j, y0j
      write(ijupiter,*) x1j, y1j
      !Saturno
      x1s = x0s + v0xs * deltaT
      y1s = y0s + v0ys * deltaT
      write(isaturno,*) x0s, y0s
      write(isaturno,*) x1s, y1s
      !Urano
      x1u = x0u + v0xu * deltaT
      y1u = y0u + v0yu * deltaT
      write(iurano,*) x0u, y0u
      write(iurano,*) x1u, y1u
      !Netuno
      x1n = x0n + v0xn * deltaT
      y1n = y0n + v0yn * deltaT
      write(inetuno,*) x0n, y0n
      write(inetuno,*) x1n, y1n
      !Plutão
      x1p = x0p + v0xp * deltaT
      y1p = y0p + v0yp * deltaT
      write(iplutao,*) x0p, y0p
      write(iplutao,*) x1p, y1p
      
c     método de Verlet
      do i = 2, n
          rts = dsqrt((x1t - xs)**2 + (y1t - ys)**2) !dist Terra-Sol
          rtj = dsqrt((x1t - x1j)**2 + (y1t - y1j)**2) !dist Terra-Jup
          rjs = dsqrt((x1j - xs)**2 + (y1j - xs)**2) !dist Jup-Sol
          !Terra:
          Fxter = (-1)*(((GMs*(x1t-xs))/(rts**3)) + ((GMs*(x1t-x1j))/(1
     +*(rtj**3)))) !x100 e x1000 alterando aqui
          x2t = 2*x1t - x0t + Fxter*(deltaT**2)
          Fyter = (-1)*(((GMs*(y1t-ys))/(rts**3)) + ((GMs*(y1t-y1j))/(1
     +*(rtj**3)))) !x100 e x1000 alterando aqui
          y2t = 2*y1t - y0t + Fyter*(deltaT**2)
          !Júpiter
          Fxjup = (-1)*(((GMs*(x1j-xs))/(rjs**3)) + ((GMs*(x1j-x1t))/(3
     +.d3*(rtj**3))))
          x2j = 2*x1j - x0j + Fxjup*(deltaT**2)
          Fyjup = (-1)*(((GMs*(y1j-ys))/(rjs**3)) + ((GMs*(y1j-y1t))/(3
     +.d3*(rtj**3))))
          y2j = 2*y1j - y0j + Fyjup*(deltaT**2)

          x0t = x1t
          x1t = x2t
          y0t = y1t
          y1t = y2t
          x0j = x1j
          x1j = x2j
          y0j = y1j
          y1j = y2j

          write(ioutT, *) x2t, y2t
          write(ioutJ, *) x2j, y2j
      end do     
      
      close(imercurio)
      close(ivenus)
      close(iterra)
      close(imarte)
      close(ijupiter)
      close(isaturno)
      close(iurano)
      close(inetuno)
      close(iplutao)

      end