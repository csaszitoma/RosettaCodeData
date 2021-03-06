TanPlus := function(a, b)
    return (a + b) / (1 - a * b);
end;

TanTimes := function(n, a)
    local x;
    x := 0;
    while n > 0 do
        if IsOddInt(n) then
            x := TanPlus(x, a);
        fi;
        a := TanPlus(a, a);
        n := QuoInt(n, 2);
    od;
    return x;
end;

Check := function(a)
    local x, p;
    x := 0;
    for p in a do
        x := TanPlus(x, SignInt(p[1]) * TanTimes(AbsInt(p[1]), p[2]));
    od;
    return x = 1;
end;

ForAll([
    [[1, 1/2], [1, 1/3]],
    [[2, 1/3], [1, 1/7]],
    [[4, 1/5], [-1, 1/239]],
    [[5, 1/7], [2, 3/79]],
    [[5, 29/278], [7, 3/79]],
    [[1, 1/2], [1, 1/5], [1, 1/8]],
    [[5, 1/7], [4, 1/53], [2, 1/4443]],
    [[6, 1/8], [2, 1/57], [1, 1/239]],
    [[8, 1/10], [-1, 1/239], [-4, 1/515]],
    [[12, 1/18], [8, 1/57], [-5, 1/239]],
    [[16, 1/21], [3, 1/239], [4, 3/1042]],
    [[22, 1/28], [2, 1/443], [-5, 1/1393], [-10, 1/11018]],
    [[22, 1/38], [17, 7/601], [10, 7/8149]],
    [[44, 1/57], [7, 1/239], [-12, 1/682], [24, 1/12943]],
    [[88, 1/172], [51, 1/239], [32, 1/682], [44, 1/5357], [68, 1/12943]]], Check);

Check([[88, 1/172], [51, 1/239], [32, 1/682], [44, 1/5357], [68, 1/12944]]);
