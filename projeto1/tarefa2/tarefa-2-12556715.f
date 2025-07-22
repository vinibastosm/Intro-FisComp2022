c     tarefa 2

c     função produto escalar
      function esc(x1, y1, z1, x2, y2, z2)
      esc = (x1*x2 + y1*y2 + z1*z2)
      return
      end function esc
      
c     funções para o produto vetorial     
      function vet1(y1, z1, y2, z2)
      vet1 = (y1*z2 - z1*y2)
      return
      end function vet1
      
      function vet2(x1, z1, x2, z2)
      vet2 = (z1*x2 - z2*x1)
      return
      end function vet2
      
      function vet3(x1, y1, x2, y2)
      vet3 = (x1*y2 - y1*x2)
      return
      end function vet3

c     função módulo de um vetor
      function  rmodulo(x1, y1, z1)
       rmodulo = sqrt(x1**2.e0 + y1**2.e0 + z1**2.e0)
      return
      end function rmodulo

c     função que calcula o volume
      function volume(x1, y1, z1, x2, y2, z2, x3, y3, z3)
      vx = vet1(y1, z1, y2, z2)
      vy = vet2(x1, z1, x2, z2)
      vz = vet3(x1, y1, x2, y2)
      volume = abs(esc(vx,vy,vz,x3-x2,y3-y2,z3-z2)) 
      return
      end function volume
      
c     função que calcula a área de duas faces igauis
      function areadp(x1,y1,z1,x2,y2,z2)
      vx = vet1(y1, z1, y2, z2)
      vy = vet2(x1, z1, x2, z2)
      vz = vet3(x1, y1, x2, y2)
      areadp = rmodulo(vx,vy,vz) * 2.e0
      return 
      end function areadp
          
c     entrada de dados
      write(*,*) 'Insira as coordenadas de v1:'
      read(*,*) a1, a2, a3
      write(*,*) 'Insira as coordenadas de v2:'
      read(*,*) b1, b2, b3
      write(*,*) 'Insira as coordenadas de v3:'      
      read(*,*) c1, c2, c3
                 
      write(*,*) 'O volume é', volume(a1,a2,a3,b1,b2,b3,c1,c2,c3)
      write(*,*) 'A área total é',(areadp(a1,a2,a3,b1,b2,b3)
     +                            + areadp(a1,a2,a3,c1-b1,c2-b2,c3-b3)
     +                            + areadp(b1,b2,b3,c1-b1,c2-b2,c3-b3))
      
      end
