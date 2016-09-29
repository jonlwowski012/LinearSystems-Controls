function homework3()
    %problem2()
    %problem7()
    problem8()
end

function problem8()
    %% Part A
    syms a b c t lambda1;
    A = [a -a;
        a -a];
    expm(A*t)
    
    %% Part B
    A = [a b c;
        a b c;
        a b c];
    expm(A*t)
    
    %% Part C
    A = lambda1*[a -a;
                a -a];
    expm(A*t)
    
    %% Part D
    A = [lambda1 1 0;
        0 lambda1 1;
        0 0 lambda1];
    expm(A*t)
    
end

function problem7()

    %% Part A
    A = [0 0 0; 2 0 0; 0 6 0];
    syms t t0;
    eA = expm(A*(t-1));
    
    %% Part B
    syms tau ut x0;
    int_inside = [1 0 0; 2*(t-tau) 1 0; 6*(t-tau)^2 6*(t-tau) 1]*[1; 0; 0]
    outside = eA*[1;1;1]
    x = outside + int(int_inside*ut)
    
    %% Part C
    x5_inside = subs(int_inside,t,5)
    x5_outside = subs(outside,t,5)
    
    %% Part D
    syms tau
    [0;0;0]-int(subs(int_inside,t,1),0,1)
    inv([1 0 0;2 1 0; 6 6 1])
    x0 = inv([1 0 0;2 1 0; 6 6 1])*([0;0;0]-int(subs(int_inside,t,1),0,1))
end

function problem2()
%% Init Matrices
    A = [1 2 3;
        4 5 6;
        7 8 9];
    B = [1 2 3 4;
        0 -1 -2 2;
        0 0 0 1];
    C=[1 0 -1 2;
        2 1 2 3;
        -1 0 1 -2];
%% Calculate Deterimants
    detA = det(A)    
    %detB = det(B);  % Error due to not being square
    %detC = det(C);  % Error  due to not being square
%% Calculate Ranks
    rankA = rank(A)
    rankB = rank(B)
    rankC = rank(C)
%% Calculate Null Spaces
    nullA = null(A,'r')
    nullB = null(B,'r')
    nullC = null(C,'r')
%% Calculate Ranges Spaces
    [R, pivcol] = rref(A);
    csA = A(:, pivcol)
    [R, pivcol] = rref(B);
    csB = B(:, pivcol)
    [R, pivcol] = rref(C);
    csC = C(:, pivcol)
end