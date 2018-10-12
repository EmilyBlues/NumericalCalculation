function[result] = threeInset(x1, y1, x2, y2, x3, y3, x4, y4, x5)
    temp1 = (x5 - x2)*(x5 - x3)*(x5 - x4)/(x1 - x2)/(x1 - x3)/(x1 - x4);
    temp2 = (x5 - x1)*(x5 - x3)*(x5 - x4)/(x2 - x1)/(x2 - x3)/(x2 - x4);
    temp3 = (x5 - x1)*(x5 - x2)*(x5 - x4)/(x3 - x1)/(x3 - x2)/(x3 - x4);
    temp4 = (x5 - x1)*(x5 - x2)*(x5 - x3)/(x4 - x1)/(x4 - x2)/(x4 - x3);
    result = y1 * temp1 + y2 * temp2 + y3 * temp3 + y4 * temp4;