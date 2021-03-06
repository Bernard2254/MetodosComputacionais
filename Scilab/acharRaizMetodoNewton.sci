//Algoritmo Newton
//{ Objetivo: Calcular a raiz de uma equação pelo método de Newton }
function[Raiz, Iter, CondErro] = Newton(x0, Toler, IterMax)
    // f = x^4 +2x^3 - 13x^2 - 14x + 24
    deff('[z]=f(x)', 'z=x^4 + 2*x^3 - 13*x^2 -14*x +24');
    Fx = feval(x0, f);
    DFx = numderivative(f, x0);
    //DFx = feval(x0, D);
    x = x0;
    Iter = 0;
    printf("Iter = %f\nx = %f\nDFx = %f\nFx = %f\n", Iter, x, DFx, Fx);
    while 1==1
        DeltaX = -Fx/DFx; x = x+DeltaX;
        Fx = feval(x, f); DFx = numderivative(f, x);
        Iter = Iter+1;
        printf("Iter = %f\nx = %f\nDFx = %f\nFx = %f\nDeltaX = %f\n", Iter, x, DFx, Fx, DeltaX);
        if (abs(DeltaX)<= Toler & abs(Fx)<=Toler) | DFx == 0 | Iter>=IterMax  then
            break;
        end
    end
    Raiz = x;
    if abs(DeltaX)<=Toler & abs(Fx)<=Toler then
        CondErro = 0;
    else
        CondErro = 1;
    end
    printf("\nRaiz = %f\nIter = %d\nCondErro = %f \n", Raiz, Iter, CondErro);
endfunction
