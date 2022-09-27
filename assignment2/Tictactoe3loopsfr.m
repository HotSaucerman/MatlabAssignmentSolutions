% This is a tictactoe game
%Constantin Heinemann
% NOTES:
% Display welcome message and name with for loop
Name=[1,2,3,4];
for i=1:length(Name)
    if i==1
        disp("WELCOME")
    elseif i==2
        disp(" TO")
    elseif i==3
        disp("  CONI'S")
    elseif i==4
        disp("   TICTACTOE")
    end
    pause (0.5)
end

    % Ask if they want to play
    x=input('WANT TO PLAY A GAME? Y/N ' ,'s');
    %If they say yes the game starts showing a cell matrix in the command
    %window
    %strcmpi from what I understand compares strings so I am comparing the
    %answers Y or N to x where Y will be signal to continue.
    %There is also a number matrix which is not shown - this matrix is used to
    %check for when the game ends.
    if strcmpi(x, 'Y')
        board = {1 2 3; 4 5 6; 7 8 9};
        boardsecret=[1 2 3; 4 5 6; 7 8 9];
        disp(board)
        %If the person does not want to play (answers N) matlab will shut down to
        %really make the user think about being more playful
    elseif strcmpi(x, 'N')
        quit
        % As it stands I don't know how to get it to be open to a whole bunch of
        % inputs so I just had it not work if you dont use Y/N
    else
        x=input('WANT TO PLAY A GAME? Y/N ' ,'s');
    end
%ADD NOTES
%The whole game is within a function PlayAgain
PlayAgain
function PlayAgain()
%Win is set to false to set up the wincons that will set it to true 
win=false;
%First 4 human and computer moves are made in a for loop the final human
%move is seperate 
forControl=[1:4];
AvailableMoves=[1:9];
%board is the cell array that the Xs and Os can be seen on boardsecret is a
%number array for checking wins 
board={1 2 3;4 5 6;7 8 9};
boardsecret=[1 2 3;4 5 6;7 8 9];
for i=1:length(forControl)
    disp("AVAILABLE MOVES")
    disp(AvailableMoves)
    HumanTurn=input("Play 1-9 ");
    %If you play outside of AvailableTurns you get looped back to input
    %again 
    while HumanTurn~=(AvailableMoves)
        HumanTurn=input("NOT AN AVAILABLE MOVE - PLAY AGAIN 1-9 ")
    end
    %Your turn is removed from AvailableMoves 
    AvailableMoves=AvailableMoves(AvailableMoves~=HumanTurn);
    %Moves are indexed on to the seen and unseen boards, I chose 11 and 12
    %to be the number input because they are outside of 1-9 and were the
    %first to my mind 
    if HumanTurn==1
        board(1,1)={'X'};
        boardsecret(1,1)=[11];
    elseif HumanTurn==2
        board(1,2)={'X'};
        boardsecret(1,2)=[11];
    elseif HumanTurn==3
        board(1,3)={'X'};
        boardsecret(1,3)=[11];
    elseif HumanTurn==4
        board(2,1)={'X'};
        boardsecret(2,1)=[11];
    elseif HumanTurn==5
        board(2,2)={'X'};
        boardsecret(2,2)=[11];
    elseif HumanTurn==6
        board(2,3)={'X'};
        boardsecret(2,3)=[11];
    elseif HumanTurn==7
        board(3,1)={'X'};
        boardsecret(3,1)=[11];
    elseif HumanTurn==8
        board(3,2)={'X'};
        boardsecret(3,2)=[11];
    elseif HumanTurn==9
        board(3,3)={'X'};
        boardsecret(3,3)=[11];
    end
    %Check to see if someone one 
    if boardsecret(1,1)==boardsecret(1,2)&& boardsecret(1,2)==boardsecret(1,3)
        win=true;
    elseif boardsecret(2,1)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(2,3)
        win=true;
    elseif boardsecret(3,1)==boardsecret(3,2)&& boardsecret(1,2)==boardsecret(3,3)
        win=true;
    elseif boardsecret(1,1)==boardsecret(2,1)&& boardsecret(2,1)==boardsecret(3,1)
        win=true;
    elseif boardsecret(1,2)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(3,2)
        win=true;
    elseif boardsecret(1,3)==boardsecret(2,3)&& boardsecret(2,3)==boardsecret(3,3)
        win=true;
    elseif boardsecret(1,1)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(3,3)
        win=true;
    elseif boardsecret(1,3)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(3,1)
        win=true;
    end
    %If there isnt anything to play from it breaks here and the game ends
    %It not needed anymore because I rewrote some stuff but remains because it works fine 
    if isempty(AvailableMoves)==true
        break
    elseif isempty(AvailableMoves)==false
        compIndex=randi(length(AvailableMoves));
        compPlay=AvailableMoves(compIndex);
    end
    %Computer move removed from available moves 
    AvailableMoves=AvailableMoves(AvailableMoves~=compPlay);
    % index the computer move onto the boards
    if compPlay==1
        board(1,1)={'O'};
        boardsecret(1,1)=[12];
    elseif compPlay==2
        board(1,2)={'O'};
        boardsecret(1,2)=[12];
    elseif compPlay==3
        board(1,3)={'O'};
        boardsecret(1,3)=[12];
    elseif compPlay==4
        board(2,1)={'O'};
        boardsecret(2,1)=[12];
    elseif compPlay==5
        board(2,2)={'O'};
        boardsecret(2,2)=[12];
    elseif compPlay==6
        board(2,3)={'O'};
        boardsecret(2,3)=[12];
    elseif compPlay==7
        board(3,1)={'O'};
        boardsecret(3,1)=[12];
    elseif compPlay==8
        board(3,2)={'O'};
        boardsecret(3,2)=[12];
    elseif compPlay==9
        board(3,3)={'O'};
        boardsecret(3,3)=[12];
    end
    disp(board)
    %check wins
    if boardsecret(1,1)==boardsecret(1,2)&& boardsecret(1,2)==boardsecret(1,3)
        win=true;
    elseif boardsecret(2,1)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(2,3)
        win=true;
    elseif boardsecret(3,1)==boardsecret(3,2)&& boardsecret(1,2)==boardsecret(3,3)
        win=true;
    elseif boardsecret(1,1)==boardsecret(2,1)&& boardsecret(2,1)==boardsecret(3,1)
        win=true;
    elseif boardsecret(1,2)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(3,2)
        win=true;
    elseif boardsecret(1,3)==boardsecret(2,3)&& boardsecret(2,3)==boardsecret(3,3)
        win=true;
    elseif boardsecret(1,1)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(3,3)
        win=true;
    elseif boardsecret(1,3)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(3,1)
        win=true;
    end
    if isempty(AvailableMoves)==true
        break
    end
    % The wincons, displays game over and asks to play again 
    if  win==true
        disp(board)
        disp('GAME OVER')
        replay=input("WANNA PLAY AGAIN Y/N ", 's');
        % run again if you want to 
        if strcmpi(replay,'Y');
            PlayAgain;
            % If no end dramatically 
        elseif strcmpi(replay,'N');
            disp('YOUR LOSS >:)')
            explode=[1:10];
            x=10;
            for i=1:length(explode)
                x=x-1;
                p=x+1;
                disp (p)
                pause(1)
            end
            disp("HAHA >:)")
            quit
        else
            % Anything else is incorrect and breaks the loop 
            disp("INCORRECT INPUT")
            break
        end
    end
end
%This is the 5th human turn because haveing the 5th turn in the for loop
%was giving me trouble. I moved it outside and only if the game hasnt ended by the
%the end of the for loop it moves on to this.  The code is pretty much
%exactly what is inside the for loop for human move. 
if win==false
    disp("AVAILABLE MOVES")
    disp(AvailableMoves)
    HumanTurn=input("Play 1-9 ");
    while HumanTurn~=(AvailableMoves)
        HumanTurn=input("NOT AN AVAILABLE MOVE - PLAY AGAIN 1-9 ")
    end
    AvailableMoves=AvailableMoves(AvailableMoves~=HumanTurn);
    if HumanTurn==1
        board(1,1)={'X'};
        boardsecret(1,1)=[11];
    elseif HumanTurn==2
        board(1,2)={'X'};
        boardsecret(1,2)=[11];
    elseif HumanTurn==3
        board(1,3)={'X'};
        boardsecret(1,3)=[11];
    elseif HumanTurn==4
        board(2,1)={'X'};
        boardsecret(2,1)=[11];
    elseif HumanTurn==5
        board(2,2)={'X'};
        boardsecret(2,2)=[11];
    elseif HumanTurn==6
        board(2,3)={'X'};
        boardsecret(2,3)=[11];
    elseif HumanTurn==7
        board(3,1)={'X'};
        boardsecret(3,1)=[11];
    elseif HumanTurn==8
        board(3,2)={'X'};
        boardsecret(3,2)=[11];
    elseif HumanTurn==9
        board(3,3)={'X'};
        boardsecret(3,3)=[11];
    end
    disp(board)
    if boardsecret(1,1)==boardsecret(1,2)&& boardsecret(1,2)==boardsecret(1,3)
        win=true;
    elseif boardsecret(2,1)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(2,3)
        win=true;
    elseif boardsecret(3,1)==boardsecret(3,2)&& boardsecret(1,2)==boardsecret(3,3)
        win=true;
    elseif boardsecret(1,1)==boardsecret(2,1)&& boardsecret(2,1)==boardsecret(3,1)
        win=true;
    elseif boardsecret(1,2)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(3,2)
        win=true;
    elseif boardsecret(1,3)==boardsecret(2,3)&& boardsecret(2,3)==boardsecret(3,3)
        win=true;
    elseif boardsecret(1,1)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(3,3)
        win=true;
    elseif boardsecret(1,3)==boardsecret(2,2)&& boardsecret(2,2)==boardsecret(3,1)
        win=true;
    end
    if  win==true
        disp(board)
        disp('GAME OVER')
        replay=input("WANNA PLAY AGAIN? Y/N ", 's');
        if strcmpi(replay,'Y');
            PlayAgain;
        elseif strcmpi(replay,'N');
            disp('YOUR LOSS ')
            explode=[1:10];
            x=10;
            for i=1:length(explode)
                x=x-1;
                p=x+1;
                disp (p)
                pause(1)
            end
            disp("HAHA")
            quit
        else
            disp("INCORRECT INPUT")
            return
        end
    end
    %if win hasnt been made true by the end of the 5th turn the tiecon is
    %presented
    if win==false
        disp ("YOU TIED A RANDOMLY PLAYING BOT LOL!")
        return
    end
end
end