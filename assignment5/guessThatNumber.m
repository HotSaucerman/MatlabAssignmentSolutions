function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Coni
%
%         DUE: November 17
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it,
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them.
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
    'This program plays the game of Guess That Number in which you have to guess\n', ...
    'a secret number.  After each guess you will be told whether your \n', ...
    'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

%The code wont run because choosing your level doesnt set it to beginner,
%moderate, or advanced. This made it so there wasnt an input into selection
%of the secret number. I have it set it save the variable level to the
%string based on number chosen. I found this by running the code and
%inputing a number.
level = input('Enter level (1-3): ');
if level == 1
    level = "beginner";
elseif level == 2
    level = 'moderate';
elseif level == 3
    level = 'advanced';
end
%Couldnt use =~ with the strings so i replaced with strcmpi and instead of
%reprompting if the strings are not beginner moderate or advanced it
%instead lets you through if they are.  Found by running the code and
%getting an error.
levelChooser=9;
while levelChooser~=10;
    if strcmpi(level,'beginner') || strcmpi(level,'moderate') || strcmpi(level,'advanced')
        %I wanted to use this if statement just for the else part of it so set
        %the if the strcmpis are what i want them to be to be a randon variable
        %that doesnt affect the code and hid it.;
        levelChooser=10;
        %This one here i created, on the first run through if you dont select between 1
        %and 3 it reprompts but if you do it again it moves forward without setting
        %the variable highest to anything. Put this section within a while loop
        %which is only satisfied if the level is correctly chosen.  If the correct
        %loop is chosen it sets the answer equivlent to the level.  Found by
        %selecting a number outside of the given range.
    else
        fprintf('Sorry, that is not a valid level selection.\n')
        level = input('Please re-enter a level of play (1-3): ');
        if level == 1
            level = "beginner";
        elseif level == 2
            level = 'moderate';
        elseif level == 3
            level = 'advanced';
        end
    end
end

% set highest secret number based on level selected
% doesnt let it slide through because comparisong between double and string
% is not supported. Put it in apostrophes.  Added apostrophes to the
% moderate condition as well and added eseif == advanced instead of the
% else.  Found by running the code to an error message
if level == 'beginner' %Bug found: I found this by trying to run the code and getting a incorrect use of '=' error message.

    highest = beginnerHighest;

elseif level == 'moderate'

    highest = moderateHighest;

elseif level == 'advanced'
    %THe h wasnt capitalized
    highest = advancedHighest;
end

% randomly select secret number between 1 and highest for level of play
% This part only sets the secretNumber to highest when you want it to
% select a random number within the range. Just set it to select random
% integer within highest. Found by removing the ; to see that the
% secretNumber was the same for each level each time.
secretNumber = randi(highest);

% initialize number of guesses and User_guess
% It starts numOfTried to 1 where it should be 0 because there has not been
% a try yet. Found by removing the ; running the code and seeing it was 1
% high.
numOfTries = 0;
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly
%There is an end missing for this while loop - found by an error message.
while userGuess ~= secretNumber

    % get a valid guess (an integer from 1-Highest) from the user

    fprintf('\nEnter a guess (1-%d): ', highest);
    userGuess = input('');
    % This part of the code uses => which doesnt allow for the user to guess at
    % the limits of the range. Changed >= to >.  Found this by inputing numbers
    % on the boundaries.
    %Additional problem - When you input nothing you get an error. Found by
    %inputting nothing.  Added a isempty to return that its not a valid guess
    %if nothing is guessed

    while isempty(userGuess)|| userGuess < 1 || userGuess > highest

        fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

        userGuess = input('');

    end % of guess validation loop

    % add 1 to the number of guesses the user has made
    numOfTries = numOfTries + 1;

    % report whether the user's guess was high, low, or correct
    % The > is flipped here to say too low when the guess is actually too high.
    % Flipped that sign. Found by showing the secret number and  intentionally
    % guessing under.
    if userGuess < secretNumber
        fprintf('Sorry, %d is too low.\n', userGuess);
    elseif userGuess > secretNumber
        fprintf('Sorry, %d is too high.\n', userGuess);
    elseif userGuess == secretNumber
        %The code is jumping here no matter what guess is made.  Turned the
        %else statement to an elseif. - Found by running code
        %The congradulations statement uses the same number twice for the
        %number and the number of tried, added numOfTries to the arrays to
        %chose from.  Found by finishing the game and seeing the incorrect end
        %message.
        fprintf('\nCongratulations!  You got the secret number %d in %d tries.\n\n',secretNumber,numOfTries);
        % Displays the fprintf after the first guess every time if you get it right
        % or not. So I moved it underneath the condition userGuess == secretNumber
        % so it only checks if it has been one try if the user. Found by playing
        % the game.
        if numOfTries == 1
            fprintf('\nLucky You!  You got it on your first try!\n\n');
        end
        % Jumped to fprintf('Game Over. Thanks for playing the Guess That Number
        % game.\n\n'); after a single guess.  So i am moving it ender the elseif
        % userGuess == secretNumber. Again just found by playing the game
        fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');
    end



    % End loop had to be added for the  userGuess~=secret number while
    % statement
end
end % of guessing while loop

% end of game