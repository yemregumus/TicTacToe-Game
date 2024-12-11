clc
clear
close(allchild(0))
% By: Dr. Kelsey Joy

%uiwait(msgbox('Hello! This will be a game of Tic Tac Toe! Let''s get started!'))
% pop up help message or not

% figure - select player modality
ColorPSscreen = [.1 .4 .8];
Playerselected = figure('Units','normalized','Position',[.25,.25,.5,.5],'Color',ColorPSscreen,...
    'MenuBar','none','NumberTitle','off','Pointer','hand','Visible','on');
TextType = uicontrol('Style','text','Units','normalized','Position',[.125,.8,.75,.125],'String',...
    'What type of mode would you like to play this game in?', 'BackgroundColor',ColorPSscreen,...
    'FontSize',22,'FontWeight','bold','ForegroundColor',[.1 0 0]);
IMAGEpvp = imread('pvp2.png');
PvP = uicontrol('Style','pushbutton','Units','normalized','Position',[.0625,.25,.40625,.5],...
    'UserData','PvP');
PvP.Units = 'pixels';
% Width = PvP.Position(3)
% PvP.CData = imresize(IMAGEpvp,[ceil(Width), NaN])
Height = PvP.Position(4);
PvP.CData = imresize(IMAGEpvp,[NaN, ceil(Height)]);
PvC =uicontrol('Style','pushbutton','Units','normalized','Position',[.531255,.25,.40625,.5],...
    'UserData','PvC');
IMAGEpvc = imread('pvc1.png');
PvC.Units = 'pixels';
Height = PvC.Position(4);
PvC.CData = imresize(IMAGEpvc,[NaN, ceil(Height)]);

PvP.Callback = {@PlayMode,PvP,PvC};
PvC.Callback = {@PlayMode,PvP,PvC};

function PlayMode(object, ~,PvP,PvC)

if strcmpi(object.UserData,'PvP')
    PvP.Enable = 'on';
    PvC.Enable = 'off';
    Player1text = uicontrol('Style','text','String','Player 1 name:','units','normalized',...
        'position',[.0625 .125 .2 .0625],'FontSize',14,'FontWeight','bold');
    Player1 = uicontrol('Style','edit','units','normalized','position',[.2625 .125 .2 .0625]);
    Player2text = uicontrol('Style','text','String','Player 2 name:','units','normalized',...
        'position',[.531255 .125 .2 .0625],'FontSize',14,'FontWeight','bold');
    Player2 = uicontrol('Style','edit','units','normalized','position',[.731255 .125 .2 .0625]);
    Player1.Callback = {@StartButton,'PvP',Player1,Player2};
    Player2.Callback = {@StartButton,'PvP',Player1,Player2};

elseif strcmpi(object.UserData,'PvC')
    PvP.Enable = 'off';
    PvC.Enable = 'on';
     Player1text = uicontrol('Style','text','String','Player 1 name:','units','normalized',...
        'position',[.531255 .125 .2 .0625],'FontSize',14,'FontWeight','bold');
    Player1 = uicontrol('Style','edit','units','normalized','position',[.731255 .125 .2 .0625]);
    Player1.Callback = {@StartButton,'PvC',Player1,''};
    
else
    fprintf('shouldn''t happen. error') 
end
end

function StartButton(~,~,Mode,Player1,Player2)

if strcmpi(Mode,'PvC')
    P2 = 'Computer';
else
    P2 = Player2.String;
end
P1 = Player1.String;

    if ~isempty(P1) && ~isempty(P2)
    StartGame = uicontrol('Style','pushbutton','Units','normalized','Position',[.35,.025,.3,.0625],...
        'String','START','FontSize',20,'FontWeight','bold','BackgroundColor',[0 .7 0]);
    StartGame.Callback = {@MainGame,Mode,P1,P2};
    end
end



