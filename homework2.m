function homework2()
    %% Initial Conditions
    y0 = [0;0;0;0];
    tspan=[0 60]

    
    %% Calculate States using State Space Equations
    [t2a,x2a] = ode45(@hw2ss2a,tspan,y0);
    [t3a,x3a] = ode45(@hw2ss3a,tspan,y0);
    
    %% Calculate Output using State Space Equations
    C = [125 0 0 0];
    D = 0;
    X1 = transpose(x2a);
    size(x2a)
    
    y2b = (C*X1);
    
    C = [0 0 0 1];
    D = 0;
    X2 = transpose(x3a);
    y3b = C*X2;
    size(y3b)
   % [t2b,y2b] = ode45(@hw2ss2b,tspan,y0);
   % [t3b,y3b] = ode45(@hw2ss3b,tspan,y0);
    
    
    %% Plot States and Outputs 
    subplot(2,2,1);
    plot(t2a,x2a(:,1));
    title('Controllable State Space States')
    
     subplot(2,2,2);
     plot(t2a,y2b(1,:));
    title('Controllable State Space Output')
    
    subplot(2,2,3);
    plot(t3a,x3a(:,1));
    title('Observable State Space States')
    
    subplot(2,2,4);
    plot(t3a,y3b(1,:));
    title('Observable State Space Output')
end

function ydot2=hw2ss2a(t,x,u)
    if(t<=2)
        u = heaviside(t);
    else
        u=0;
    end
    A = [0 1 0 0;
      0 0 1 0;
       0 0 0 1;
       -125 -5 -22.55 -0.9/2];
    B = [0;0;0;1];
    ydot2 = (A*x) + (B*u);
    
end


function y=hw2ss2b(t,x,u)
    if(t<=2)
        u = heaviside(t);
    else
        u=0;
    end
    C = [125 0 0 0];
    D = 0;
    xdot = x(2);
    xdot2 = x(3);
    xdot3 = x(4);
    xdot4 = (-0.9*x(4)-45.1*x(3)-10*x(2)-250*x(1)+250*u)/2;
    xdot=[xdot;xdot2;xdot3;xdot4];
    y = [(C*x)+(D*u);0;0;0];
end



function ydot3=hw2ss3a(t,x,u)
    if(t<=2)
        u = heaviside(t);
    else
        u=0;
    end
    A = [0 0 0 -250/2;
      1 0 0 -10/2;
      0 1 0 -22.55;
      0 0 1 -.9/2];
   
    B = [125;0;0;0];
   
    ydot3 = (A*x)+(B*u);
end

function ydot2=hw2ss3b(t,x,u)
    if(t<=2)
        u = heaviside(t);
    else
        u=0;
    end
    C = [0 0 0 1];
    D = 0;
    xdot = x(2);
    xdot2 = x(3);
    xdot3 = x(4);
    xdot4 = (-0.9*x(4)-45.1*x(3)-10*x(2)-250*x(1)+250*u)/2;
    xdot=[xdot;xdot2;xdot3;xdot4];
    ydot2 = [(C*x)+(D*u);0;0;0];
end
