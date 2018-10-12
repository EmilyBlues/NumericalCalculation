function[result] = linearInset(x1, y1, x2, y2, x3)
    result = y2 + (y2 - y1) / (x2 - x1) * (x3 - x1);
