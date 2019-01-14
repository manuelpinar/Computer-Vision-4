%clasificacion de datos
k=menu('Elija el numero de grupos para la relaizacion del k-means','1 Grupo','2 Grupos','3 Grupos','4 Grupos','5 Grupos','6 Grupos');
TIPO_ISODATA=menu('Elija el tipo de isodata que desea ejecutar','isodata 1','isodata 2');
if TIPO_ISODATA==1;
    isodata=input('Distancia critica entre centroides:');
end;
if TIPO_ISODATA==2;
    num_puntos=input('Numero de puntos minimos por grupos:');
end;
P=0;
numero=zeros(1,6);
x=['y.' 'g.' 'm.' 'b.' 'c.' 'k.']; %Definimos un vector de strings
clear cent 
datos=zeros(2,267);
datos(1,:)=X(1,:);
datos(2,:)=Y(1,:);
for c=1:k
    cent(:,c)=datos(:,c);    %Cogemos los k centroides
end;
Pcent(6,2)=2;
while ((1 < Pcent(1,1)) | (1 < Pcent(1,2)) | (1 < Pcent(2,1)) | (1 < Pcent(2,2))| (1 < Pcent(3,1)) | (1 < Pcent(3,2))| (1 < Pcent(4,1))| (1 < Pcent(4,2))| (1 < Pcent(5,1))| (1 < Pcent(5,2))| (1 < Pcent(6,1))| (1 < Pcent(6,2)))
    Pcent(6,2)=0;     %Pcent es la distancia entre el centroide anterior y el nuevo.
    clear GX1 GY1 GX2 GY2 GX3 GY3 GX4 GY4 GX5 GY5 GX6 GY6 dis
    g1=1;
    g2=1;
    g3=1;
    g4=1;
    g5=1;
    g6=1;
    for i=1:267;
        for s=1:k;
        d=sqrt((datos(1,i)-cent(1,s))^2+(datos(2,i)-cent(2,s))^2);
        dis(1,s)=d;
        end;
        [m P]=min(dis);
    
        if P==1;
             GX1(1,g1)=datos(1,i); %Asignamos los datos al grupo que corresponda
             GY1(1,g1)=datos(2,i);
             g1=g1+1;
        elseif P==2;
            GX2(1,g2)=datos(1,i);
            GY2(1,g2)=datos(2,i);
            g2=g2+1;  
        elseif P==3;
            GX3(1,g3)=datos(1,i);
            GY3(1,g3)=datos(2,i);
            g3=g3+1;
        elseif P==4;
            GX4(1,g4)=datos(1,i);
            GY4(1,g4)=datos(2,i);
            g4=g4+1;
        elseif P==5;
            GX5(1,g5)=datos(1,i);
            GY5(1,g5)=datos(2,i);
            g4=g4+1;
        else 
            GX6(1,g6)=datos(1,i);
            GY6(1,g6)=datos(2,i);
            g6=g6+1;
        end
        
    end
    
    Pcent(1,1)=abs(cent(1,1)-mean(GX1));
    Pcent(1,2)=abs(cent(2,1)-mean(GY1));
    cent(1,1)=mean(GX1);
    cent(2,1)=mean(GY1);   
    if k>1
        Pcent(2,1)=abs(cent(1,2)-mean(GX2));
        Pcent(2,2)=abs(cent(2,2)-mean(GY2));
        cent(1,2)=mean(GX2);
        cent(2,2)=mean(GY2);
    end
    if k>2;
        Pcent(3,1)=abs(cent(1,3)-mean(GX3));
        Pcent(3,2)=abs(cent(2,3)-mean(GY3));
        cent(1,3)=mean(GX3);
        cent(2,3)=mean(GY3);
    end
    if k>3
        Pcent(4,1)=abs(cent(1,4)-mean(GX4));
        Pcent(4,2)=abs(cent(2,4)-mean(GY4));
        cent(1,4)=mean(GX4);
        cent(2,4)=mean(GY4);
    end
    if k>4
        Pcent(5,1)=abs(cent(1,5)-mean(GX5));
        Pcent(5,2)=abs(cent(2,5)-mean(GY5));
        cent(1,5)=mean(GX5);
        cent(2,5)=mean(GY5);
    end
    if k>5
        Pcent(6,1)=abs(cent(1,6)-mean(GX6));
        Pcent(6,2)=abs(cent(2,6)-mean(GY6));
        cent(1,6)=mean(GX6);
        cent(2,6)=mean(GY6);
    end
end
mat=zeros(6);
mat(:,:)=3000; %matriz de distancias entre grupos
for f=2:k;
    for i=2:k    
        if f > (i-1)
            M=sqrt((cent(1,f)-cent(1,i-1))^2+(cent(2,f)-cent(2,i-1))^2);
            if M~=0;
                mat(i-1,f)=M; %La distancia de cada centroide con el resto de centroides. 
            end;
        end
    end
end


if k==1;
    plot(GX1,GY1,'y.'),title('1 CONJUNTO')
    figure,plot(GX1,GY1,'y.'),title('ISODATA')
elseif k==2;
    plot(GX1,GY1,'y.',GX2,GY2,'g.'),title('2 CONJUNTOS')
elseif k==3;
    plot(GX1,GY1,'y.',GX2,GY2,'g.',GX3,GY3,'m.'),title('3 CONJUNTOS')
elseif k==4;
    plot(GX1,GY1,'y.',GX2,GY2,'g.',GX3,GY3,'m.',GX4,GY4,'b.'),title('4 CONJUNTOS')
elseif k==5;
    plot(GX1,GY1,'y.',GX2,GY2,'g.',GX3,GY3,'m.',GX4,GY4,'b.',GX5,GY5,'c.'),title('5 CONJUNTOS')
else
    plot(GX1,GY1,'y.',GX2,GY2,'g.',GX3,GY3,'m.',GX4,GY4,'b.',GX5,GY5,'c.',GX6,GY6,'k.'),title('6 CONJUNTOS')
end
if TIPO_ISODATA==1;
for i=1:6;
    for j=1:6;
        if (mat(i,j)<isodata)&(mat(i,j)~=3000)
            x((2*j)-1:2*j)=x((2*i)-1:2*i); %Ponemos el color del grupo que se encuentre mas cercano
        end;
    end;
end;

if k==2;
    figure,plot(GX1,GY1,x(1:2),GX2,GY2,x(3:4)),title('ISODATA 1')
elseif k==3;
   figure,plot(GX1,GY1,x(1:2),GX2,GY2,x(3:4),GX3,GY3,x(5:6)),title('ISODATA 1')
elseif k==4;
    figure,plot(GX1,GY1,x(1:2),GX2,GY2,x(3:4),GX3,GY3,x(5:6),GX4,GY4,x(7:8)),title('ISODATA 1')
elseif k==5;
    figure,plot(GX1,GY1,x(1:2),GX2,GY2,x(3:4),GX3,GY3,x(5:6),GX4,GY4,x(7:8),GX5,GY5,x(9:10)),title('ISODATA 1')
else
    figure,plot(GX1,GY1,x(1:2),GX2,GY2,x(3:4),GX3,GY3,x(5:6),GX4,GY4,x(7:8),GX5,GY5,x(9:10),GX6,GY6,x(11:12)),title('ISODATA 1')
end
end

if TIPO_ISODATA==2; 
    numero(1,1)=g1-1;
    numero(1,2)=g2-1;
    numero(1,3)=g3-1;
    numero(1,4)=g4-1;
    numero(1,5)=g5-1;
    numero(1,6)=g6-1;
 [A B]=min(mat);   
 for i=1:6;
     if numero(1,i)<num_puntos
         x((2*i)-1:2*i)=x((2*B(1,i))-1:2*B(1,i));
     end
 end
if k==2;
    figure,plot(GX1,GY1,x(1:2),GX2,GY2,x(3:4)),title('ISODATA 2')
elseif k==3;
   figure,plot(GX1,GY1,x(1:2),GX2,GY2,x(3:4),GX3,GY3,x(5:6)),title('ISODATA 2')
elseif k==4;
    figure,plot(GX1,GY1,x(1:2),GX2,GY2,x(3:4),GX3,GY3,x(5:6),GX4,GY4,x(7:8)),title('ISODATA 2')
elseif k==5;
    figure,plot(GX1,GY1,x(1:2),GX2,GY2,x(3:4),GX3,GY3,x(5:6),GX4,GY4,x(7:8),GX5,GY5,x(9:10)),title('ISODATA 2')
else
    figure,plot(GX1,GY1,x(1:2),GX2,GY2,x(3:4),GX3,GY3,x(5:6),GX4,GY4,x(7:8),GX5,GY5,x(9:10),GX6,GY6,x(11:12)),title('ISODATA 2')
end   
end