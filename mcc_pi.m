function cel_koord = mcc_pi(st_tock)
    x = 2*rand(st_tock, 1) - 1;
    y = 2*rand(st_tock, 1) - 1;
    koorn = zeros(st_tock, 2);
    seznam_r = zeros(st_tock, 1);
    st_not_tock = 0;

    for i = 1:st_tock
        koor = [x, y];
        radij = sqrt(koor(i, 1)^2 + koor(i, 2)^2);
        seznam_r(i) = radij;
        if seznam_r(i) <= 1
            koorn(i, :) = koor(i, :);
            st_not_tock = st_not_tock + 1;
        end    
    end    
    %koordinate_tock_znotraj_kroga = koorn;
    %koordinate_tock_znotraj_kvadrata = koor;
    %st_not_tock;
    %pribljizek = 4*st_not_tock/st_tock;
    cel_koord = [koorn, koor];
end