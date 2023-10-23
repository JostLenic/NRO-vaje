clear;
clc;
a = 1000;
R = 1;


vec_aproksim = vec_aproks(a);
[aproksimacija, odstopek, matrika_vseh_tock] = aproks(a);
disp(['Stevilo vzetih tock: ', num2str(a)]);
disp(['Ocenjena vrednost: ', num2str(aproksimacija)]);
disp(['Napaka: ', num2str(odstopek)]);
mvt = matrika_vseh_tock;
krog(R)
hold on;
x = mvt(:, 1);
y = mvt(:, 2);
oddaljenost = sqrt(x.^2 + y.^2);
Notri = oddaljenost <= R;
Zunaj = oddaljenost > R;
scatter(x(Notri), y(Notri), 50, 'green', '.');
scatter(x(Zunaj), y(Zunaj), 50, 'red', 'x');
title('Grafični prikaz točk in križnice');
xlabel('X-os');
ylabel('Y-os');
legend('Krožnica', 'Točke znotraj', 'Točke zunaj');

%plot(linspace(1, a, a), vec_aproksim)


function krog(radij)
    phi = linspace(0, 2*pi, 1000);
    x = radij * cos(phi);
    y = radij * sin(phi);
    figure;
    plot(x, y, 'k', 'LineWidth', 2);
    axis equal;
end


function [aproksimacija, odstopek, matrika_vseh_tock] = aproks(x)
    M1 = mcc_pi(x);
    M = M1(:, 1:2);
    U = 0;
    for i = 1:x
        if M(i, 1:2) ~= 0
            U = U + 1;
        end
    end
    aproksimacija = 4*U/x;
    odstopek = abs(pi - aproksimacija);
    matrika_vseh_tock = M1(:, 3:4);
end


function vec_aproksimacij = vec_aproks(y)
    VA = zeros(y, 1);
    for k = 1:y
        VA(k) = aproks(k);
    end
    vec_aproksimacij = VA;
end
