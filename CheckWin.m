function [IFWIN, WINNER] = CheckWin (Board)
% By: Dr. Kelsey Joy

%check rows
IFWIN = 'no'; %winner = 'yes' or no winner = 'no'
WINNER = [];

ROWcheck = sum(Board,2)';
COLcheck = sum(Board,1);
Diagonalcheck1 = Board(1,1)+Board(2,2)+Board(3,3);
Diagonalcheck2 = Board(1,3)+Board(2,2)+Board(3,1);
ALLchecks = [ROWcheck,COLcheck,Diagonalcheck1,Diagonalcheck2];
if ~isempty(find(ALLchecks==3))
    IFWIN = 'yes';
    WINNER = 1;
elseif ~isempty(find(ALLchecks==-3))
    IFWIN = 'yes';
    WINNER = -1;
end

if (sum(sum(Board==0)))==0 && ~strcmpi(IFWIN,'yes')
    IFWIN = 'tie';
end
    



