
function stackednet = COUNTSTACK(num,a,softnet)
   switch num
      case 1
         stackednet = stack(a{1},softnet);
      case 2
         stackednet = stack(a{1},a{2},softnet);
      case 3
         stackednet = stack(a{1},a{2},a{3},softnet);
      case 4
         stackednet = stack(a{1},a{2},a{3},a{4},softnet);
      case 5
         stackednet = stack(a{1},a{2},a{3},a{4},a{5},softnet);
      case 6
         stackednet = stack(a{1},a{2},a{3},a{4},a{5},a{6},softnet);
      case 7
         stackednet = stack(a{1},a{2},a{3},a{4},a{5},a{6},a{7},softnet);
      case 8
         stackednet = stack(a{1},a{2},a{3},a{4},a{5},a{6},a{7},a{8},softnet);
      case 9
         stackednet = stack(a{1},a{2},a{3},a{4},a{5},a{6},a{7},a{8},a{9});
      case 10
         stackednet = stack(a{1},a{2},a{3},a{4},a{5},a{6},a{7},a{8},a{9},a{10});
      otherwise
         stackednet = stack(a{1},a{2},a{3},a{4},a{5},a{6},a{7},a{8},a{9},a{10},a{11});
   end

end